#!/bin/sh
GO_TGZ="go1.11.linux-amd64.tar.gz"
wget "https://dl.google.com/go/${GO_TGZ}"
sudo rm -rf /usr/local/go # remove existing version
sudo tar -C /usr/local -xzf "${GO_TGZ}"
sudo grep -q -F 'export PATH=$PATH:/usr/local/go/bin' "${HOME}/.bashrc" || echo 'export PATH=$PATH:/usr/local/go/bin' >> "${HOME}/.bashrc"
sudo grep -q -F 'export PATH=$PATH:${HOME}/go/bin' "${HOME}/.bashrc" || echo 'export PATH=$PATH:${HOME}/go/bin' >> "${HOME}/.bashrc"
source "${HOME}/.bashrc"
