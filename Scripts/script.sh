#!/bin/bash

declare -a ParuPackage=("lua-language-server" "fortran-language-server" "cmake-language-server"
"haskell-language-server-static" "kotlin-language-server" "netcoredbg" "omnisharp-roslyn"
"prettier" "prettierd" "rust-analyzer" "shellcheck" "shfmt" "stylua" "vint" "clang" "codelldb"
"cpplint" "delve" "dockerfile-language-server-bin" "gopls" "hadolint" "jdtls" "ruby")

declare -a NPMPackage=("bash-language-server" "@angular/language-server" "@tailwindcss/language-server"
"typescript-language-server" "typescript")

declare -a PIPPackage=("pyright" "black" "flake8" "xmlformatter")

for package in "${ParuPackage[@]}"; do
  paru -S "${package}"
done

for package in "${NPMPackage[@]}"; do
  sudo npm install -g "${package}"
done

for package in "${PIPPackage[@]}"; do
  pip3 "${package}"
done

sudo npm install -g xo --save-dev
sudo npm install -g --save vscode-css-languageservice

go install golang.org/x/tools/cmd/goimports@latest

gem install ruby-lsp
gem install rubocop
