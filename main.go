package main

import (
	"fmt"

	"google.golang.org/protobuf/proto"
)

func main() {
	test1 := &Test{
		SomeText: "hello",
	}

	// []byte に変換
	out, _ := proto.Marshal(test1)

	test2 := &Test{}

	// []byte から再度 Test{} に変換
	_ = proto.Unmarshal(out, test2)

	fmt.Println(test2.SomeText)
}
