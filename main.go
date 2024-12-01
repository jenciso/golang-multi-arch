package main

import (
	"fmt"
	"runtime"
)

func main() {
	fmt.Println("Hello world... Running on:")
	fmt.Println(runtime.GOOS, runtime.GOARCH)
}
