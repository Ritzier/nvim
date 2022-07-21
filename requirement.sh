#!/bin/bash

paru -S bash-language-server shellcheck shfmt prettier stylelint hadolint golangci-lint vscode-eslint-language-server php-codesniffer ruby-rubocop vint uncrustify mono 
pip3 install pyright black cpplint flake8
go install golang.org/x/tools/cmd/goimports@latest
cargo install stylua
