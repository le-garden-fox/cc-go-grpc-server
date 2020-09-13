package main

import (
	"context"
	"fmt"
	"net"

	"google.golang.org/grpc"
)

// server local struct server object
type server struct{}

// {{cookiecutter.module_name | capitalize }} implementation of the interface
func (*server) {{cookiecutter.module_name | capitalize }}(ctx context.Context, req *{{cookiecutter.module_name}}pb.{{cookiecutter.module_name | capitalize }}Request) (*{{cookiecutter.module_name}}pb.{{cookiecutter.module_name | capitalize }}Response, error) {
	fmt.Printf("Called {{cookiecutter.module_name}} %v", req)
	firstName := req.Get{{cookiecutter.module_name | capitalize }}() //.GetFirstName()
	result := "Hello " + firstName
	res := &{{cookiecutter.module_name}}pb.{{cookiecutter.module_name | capitalize }}Response{
		Result: result,
	}
	return res, nil
}

func main() {
	lis, err := net.Listen("tcp", "0.0.0.0:50051")
	if err != nil {
		fmt.Println(err)
	}
	s := grpc.NewServer()
	{{cookiecutter.module_name}}pb.Register{{cookiecutter.module_name | capitalize }}ServiceServer(s, &server{})

	if err := s.Serve(lis); err != nil {
		fmt.Println(err)
	}
}
