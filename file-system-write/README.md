# file-system-write


## 実行
```
dagger --log-format=plain do generateFile
```

### 実行結果
```
$ dagger --log-format=plain do generateFile
6:05PM INFO  client.filesystem.dist.read | computing
6:05PM INFO  client.filesystem.dist.read | completed    duration=0s
6:05PM INFO  actions.generateFile.write | computing
6:05PM INFO  actions.generateFile.write | completed    duration=0s
6:05PM INFO  client.filesystem.dist.write | computing
6:05PM INFO  client.filesystem.dist.write | completed    duration=500ms
{}
$ ls dist
hello-world.txt
$ cat dist/hello-world.txt
hello, world!
```

## module の定義
- [universe.dagger.io/bash/bash.cue](cue.mod/pkg/universe.dagger.io/bash/bash.cue)
    - GitHub: [dagger/bash.cue at v0.2.23 · dagger/dagger](https://github.com/dagger/dagger/blob/v0.2.23/pkg/universe.dagger.io/bash/bash.cue)
- [universe.dagger.io/docker/run.cue](cue.mod/pkg/universe.dagger.io/docker/run.cue)
    - GitHub: [dagger/run.cue at v0.2.23 · dagger/dagger](https://github.com/dagger/dagger/blob/v0.2.23/pkg/universe.dagger.io/docker/run.cue)
- [dagger.io/dagger/core/fs.cue](cue.mod/pkg/dagger.io/dagger/core/fs.cue)
    - GitHub: [dagger/fs.cue at v0.2.23 · dagger/dagger](https://github.com/dagger/dagger/blob/v0.2.23/pkg/dagger.io/dagger/core/fs.cue)
- [dagger.io/dagger/plan.cue](cue.mod/pkg/dagger.io/dagger/plan.cue)
    - GitHub: [dagger/plan.cue at v0.2.23 · dagger/dagger](https://github.com/dagger/dagger/blob/v0.2.23/pkg/dagger.io/dagger/plan.cue)
