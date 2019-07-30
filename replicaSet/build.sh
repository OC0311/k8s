#!/usr/bin/env bash

export CGO_ENABLED=0
export GOOS=linux
export GOARCH=amd64

function buildWeb(){
	go build -o  ./rootf/web main.go
}

function buildImage(){
	cd ./rootf/
	docker build -t pod_demo:v1 .
}

function runDocker(){
	docker run -d --name=pod_demo -p 31344:31344 pod_demo:v1
}

##########################################
buildWeb
buildImage
runDocker