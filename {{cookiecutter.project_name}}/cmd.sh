#!/usr/bin/env bash

function main() {
    case $1 in
    "build-grpc")
        docker build -t edgar/gogrpc -f Dockerfile.grpc .
        ;;
    "build-server")
        docker build -t edgar/pbserver -f Dockerfile.server .
        ;;
    "build-client")
        docker build -t edgar/pbclient -f Dockerfile.client .
        ;;
    "run-server")
        docker run -it edgar/pbserver -p 50051:50051
        ;;
    "run-client")
        echo "TODO"
        #docker run -it edgar/pbserver -p 50051:50051
        ;;
    "gen")
        protoc {{cookiecutter.module_name}}/{{cookiecutter.module_name}}pb/{{cookiecutter.module_name}}.proto --go_out=plugins=grpc:.
        ;;
    "tst-server")
        go run {{cookiecutter.module_name}}/{{cookiecutter.module_name}}-server/server.go
        ;;
    "tst-client")
        go run {{cookiecutter.module_name}}/{{cookiecutter.module_name}}-client/client.go
        ;;
    *)
        echo "Invalid arguments"
        ;;
    esac
}

main "$@"
