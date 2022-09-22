package main

import (
	"os"
	"strconv"
	"time"
)

func main() {
	d, _ := strconv.Atoi(os.Args[1])
	time.Sleep(time.Duration(d) * time.Minute)
	os.Stdout.WriteString("done\n")
}
