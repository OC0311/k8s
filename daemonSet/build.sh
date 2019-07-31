#!/usr/bin/env bash

export CGO_ENABLED=0
export GOOS=linux
export GOARCH=amd64

function buildWeb(){
	go build -o  ./rootf/web main.go
}

function buildImage(){
	cd ./rootf/
	docker build -t test_web:v1 .
	# 制作更新镜像
	docker build -t test_web:v2 .
}

##########################################
buildWeb
buildImage