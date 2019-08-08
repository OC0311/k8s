#!/usr/bin/env bash

export CGO_ENABLED=0
export GOOS=linux
export GOARCH=amd64

function buildWeb(){
	go build -o  ./rootf/web main.go
}

function buildImage(){
	cd ./rootf/
	docker build -t rjjrjj1013/web_backend:v1 .
}

##########################################
buildWeb
buildImage
