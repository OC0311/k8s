#!/usr/bin/env bash

export CGO_ENABLED=0
export GOOS=linux
export GOARCH=amd64

function buildWeb(){
	go build -o  ./rootf/state main.go
}

function buildImage(){
	cd ./rootf/
	docker build -t stateful:v1 .
}

##########################################
buildWeb
buildImage