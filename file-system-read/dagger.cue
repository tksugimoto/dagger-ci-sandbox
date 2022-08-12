package main

import (
	"dagger.io/dagger"
	"universe.dagger.io/bash"
)

dagger.#Plan & {
	actions: {
		lsCat: bash.#RunSimple & {
			always: true
			script: contents: #"""
				echo '$ pwd'
				pwd

				echo '$ ls -la ./'
				ls -la ./

				echo '$ cat "./hello.txt"'
				cat "./hello.txt"
			"""#
			workdir: "/workdir42" // 42 は区別用
			mounts: {
				Source: {
					dest: workdir
					contents: client.filesystem.".".read.contents
				}
			}
		}
	}
	client: filesystem: ".": {
		read: {
			include: [
				"hello.txt",
			]
		}
	}
}
