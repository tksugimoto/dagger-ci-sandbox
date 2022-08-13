package main

import (
	"dagger.io/dagger"
	"dagger.io/dagger/core"
	"universe.dagger.io/bash"
)

dagger.#Plan & {
	client: filesystem: {
		dist: {
			read: contents: dagger.#FS
			write: contents: actions.generateFile.result
		}
		"dist/output.txt": write: contents: actions.generateFileByCommand.export.files["hello.txt"]
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
		generateFileByCommand: bash.#RunSimple & {
			always: true
			_text: "999"
			script: contents: "echo 'abc, \(_text)' > ./hello.txt"
			// workdir: "/workdir" // default: "/"
			export: files: {
				"hello.txt": _ // ※ export: files: の base は workdir で変更されず "/" からの path らしい
			}
		}
	}
}
