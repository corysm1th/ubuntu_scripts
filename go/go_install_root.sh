#!/bin/sh
GO_TGZ="go1.11.5.linux-amd64.tar.gz"
wget "https://dl.google.com/go/${GO_TGZ}"
rm -rf /usr/local/go # remove existing version
tar -C /usr/local -xzf "${GO_TGZ}"
grep -q -F 'export PATH=$PATH:/usr/local/go/bin' "${HOME}/.bashrc" || echo 'export PATH=$PATH:/usr/local/go/bin' >> "${HOME}/.bashrc"
grep -q -F 'export PATH=$PATH:${HOME}/go/bin' "${HOME}/.bashrc" || echo 'export PATH=$PATH:${HOME}/go/bin' >> "${HOME}/.bashrc"
grep -q -F 'export GOPATH=${HOME}/go' "${HOME}/.bashrc" || echo 'export GOPATH=${HOME}/go' >> "${HOME}/.bashrc"
