#!/bin/sh
GO_TGZ="go1.10.3.linux-amd64.tar.gz"
wget "https://dl.google.com/go/${GO_TGZ}"
sudo tar -C /usr/local -xzf "${GO_TGZ}"
sudo grep -q -F 'export PATH=$PATH:/usr/local/go/bin' "${HOME}/.bashrc" || echo 'export PATH=$PATH:/usr/local/go/bin' >> "${HOME}/.bashrc"
source "${HOME}/.bashrc"
