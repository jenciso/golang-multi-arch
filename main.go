package main

import (
	"fmt"
	"runtime"
)

func main() {
  fmt.Println("Hello world... Running on this platform:")
  fmt.Println(runtime.GOOS, runtime.GOARCH)
}
