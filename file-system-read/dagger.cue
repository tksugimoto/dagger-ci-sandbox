package main

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
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
					contents: _source.output
				}
			}

			_source: core.#Source & {
				path: "."
				include: [
					"hello.txt",
				]
			}
		}
	}
}
