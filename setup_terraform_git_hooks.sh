# Adopted from https://github.com/antonbabenko/pre-commit-terraform
# Follow installation instruction on that repo first
# Run from the root directory of the repository
# Run manually by "pre-commit run -a"

DIR=~/.git-template
git config init.templateDir ${DIR}
pre-commit init-templatedir -t pre-commit ${DIR}

cat <<EOF > .pre-commit-config.yaml
repos:
- repo: git://github.com/antonbabenko/pre-commit-terraform
  rev: v1.31.0
  hooks:
    - id: terraform_fmt
    - id: terraform_docs
EOF


