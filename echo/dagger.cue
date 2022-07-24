package main

import (
	"dagger.io/dagger"

	"universe.dagger.io/bash"
)

dagger.#Plan & {
	actions: {
		echo: bash.#RunSimple & {
			always: true
			script: contents: #"""
				echo "Hello World!"
			"""#
		}
	}
}
