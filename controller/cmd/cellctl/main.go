// cellctl: Cell fleet controller. Skeleton; see ADR 0011 and CELL-009.
package main

import (
	"fmt"
	"os"
)

var version = "ctl-v0.0.0-dev"

func main() {
	if len(os.Args) > 1 && os.Args[1] == "version" {
		fmt.Println(version)
		return
	}
	fmt.Fprintln(os.Stderr, "cellctl: serve not implemented yet (CELL-009)")
	os.Exit(2)
}
