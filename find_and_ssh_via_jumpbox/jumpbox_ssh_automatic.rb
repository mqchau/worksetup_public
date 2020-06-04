# USAGE: bundle install && bundle exec ruby jumpbox_ssh_automatic.rb <service> <region - default us-west-2>

service_name = ARGV.first
region = ARGV[1] || 'us-west-2'

require 'aws-sdk-ec2'
require 'tty-prompt'

prompt = TTY::Prompt.new
ec2_client = Aws::EC2::Client.new(region: region)

running_instances_by_service = ec2_client.describe_instances({
  filters: [
    {
      name: "tag:service",
      values: [ARGV.first]
    },
    {
      name: "instance-state-name",
      values: ["running"]
    },
  ],
}).reservations.flat_map { |x| x.instances }

def get_name(instance)
  instance.tags.detect { |t| t.key == 'Name' }&.value
end

target_instance_id = begin
  if running_instances_by_service.size == 1
    running_instances_by_service.first.instance_id
  else
    promt_text = "Found #{running_instances_by_service.size} for #{service_name}. Choose one of following targets:"

    choices = %w(vodka beer wine whisky bourbon)
    choices = running_instances_by_service.map do |instance|
      {
        value: instance.instance_id,
        name: "#{instance.instance_id} - Name: #{get_name(instance)}"
      }
    end
    prompt.enum_select(promt_text, choices)
  end
end

puts "SSHing into #{target_instance_id}"

jumpbox_instance_id = ec2_client.describe_instances({
  filters: [
    {
      name: "tag:service",
      values: ['services-ssh']
    },
    {
      name: "instance-state-name",
      values: ["running"]
    },
  ],
}).reservations.first&.instances&.first&.instance_id

raise "Cannot find jumpbox instance" if jumpbox_instance_id.nil?

jumpox_instance_public_dns_name = Aws::EC2::Instance.new(jumpbox_instance_id, client: ec2_client).public_dns_name

target_instance = Aws::EC2::Instance.new(target_instance_id, client: ec2_client)
target_instance_private_dns_name = target_instance.private_dns_name
if target_instance.security_groups.detect { |g| g.group_name.include?('InternalSSHSG') }.nil?
  current_sgs = target_instance.security_groups.map(&:group_id)
  puts "Assigning security group InternalSSHSG to #{target_instance_id}"
  internal_ssh_sg = ec2_client.describe_security_groups.security_groups.detect { |sg| sg.group_name.include?('InternalSSHSG') }
  raise "Cannot find InternalSSHSG security group" if internal_ssh_sg.nil?
  target_instance.modify_attribute(groups: current_sgs << internal_ssh_sg.group_id)
end

command = <<-STR.strip
  ssh -o "ProxyCommand ssh -W %h:%p centos@#{jumpox_instance_public_dns_name}" centos@#{target_instance_private_dns_name}
STR

system(command)
