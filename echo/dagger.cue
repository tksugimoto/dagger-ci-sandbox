package main

import (
	"dagger.io/dagger"

	"universe.dagger.io/docker"
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
		echoOnUbuntu: bash.#Run & {
			_ubuntu: docker.#Pull & {
				source: "ubuntu:latest"
			}
			input: _ubuntu.output
			always: true
			script: contents: #"""
				echo "Hello World!"
			"""#
		}
	}
}
