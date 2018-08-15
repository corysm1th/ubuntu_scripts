#!/bin/sh
PROTOC="protoc-3.6.1-linux-x86_64.zip"
wget "https://github.com/google/protobuf/releases/download/v3.6.1/${PROTOC}"
unzip "${PROTOC}"
sudo cp bin/protoc /usr/local/bin/
sudo cp -R include/google /usr/local/include/
go get -u github.com/golang/protobuf/protoc-gen-go
