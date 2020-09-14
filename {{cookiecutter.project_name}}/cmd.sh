#!/usr/bin/env bash

function main() {
    case $1 in
    "build")
        docker build -t {{cookiecutter.repository_user}}/{{cookiecutter.module_name}} -f Dockerfile.server .
        ;;
    "run")
        docker run -it {{cookiecutter.repository_user}}/{{cookiecutter.module_name}} -p {{cookiecutter.server_port}}:{{cookiecutter.server_port}}
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
