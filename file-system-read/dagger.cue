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

				echo '$ ls -la /src/'
				ls -la /src/

				echo '$ cat "/src/hello.txt"'
				cat "/src/hello.txt"
			"""#
			mounts: {
				Source: {
					dest: "/src"
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
