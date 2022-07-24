package main

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
)

dagger.#Plan & {
	client: filesystem: {
		dist: {
			read: contents: dagger.#FS
			write: contents: actions.generateFile.result
		}
	}
	actions: {
		generateFile: {
			name: "world"
			write: core.#WriteFile & {
				input: client.filesystem.dist.read.contents
				path: "hello-\(name).txt"
				contents: "hello, \(name)!\n"
			}
			result: write.output
		}
	}
}
