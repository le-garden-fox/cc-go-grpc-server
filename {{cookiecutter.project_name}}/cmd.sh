#!/usr/bin/env bash

function main() {
    case $1 in
    "build")
        docker build -t edgar/{{cookiecutter.module_name}} -f Dockerfile.server .
        ;;
    "run")
        docker run -it edgar/{{cookiecutter.module_name}} -p {{cookiecutter.server_port}}:{{cookiecutter.server_port}}
        ;;
    "gen")
        protoc {{cookiecutter.module_name}}/{{cookiecutter.module_name}}pb/{{cookiecutter.module_name}}.proto --go_out=plugins=grpc:.
        ;;
    "test")
        go run {{cookiecutter.module_name}}/{{cookiecutter.module_name}}-server/server.go
        ;;
    *)
        echo "Invalid arguments"
        ;;
    esac
}

main "$@"
