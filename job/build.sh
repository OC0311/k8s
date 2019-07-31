#!/usr/bin/env bash

export CGO_ENABLED=0
export GOOS=linux
export GOARCH=amd64

function buildWeb(){
	go build -o  ./rootf/job main.go
}

function buildImage(){
	cd ./rootf/
	docker build -t job:v1 .
}

##########################################
buildWeb
buildImage