# echo
echo コマンドを実行するだけ

## 実行
```
dagger --log-format=plain do echo
```

### 実行結果
```
$ dagger --log-format=plain do echo
3:34PM INFO  actions.echo.script._write | computing
3:34PM INFO  actions.echo._simpleImage._dag."0"._pull | computing
3:34PM INFO  actions.echo.script._write | completed    duration=0s
3:34PM INFO  actions.echo._simpleImage._dag."0"._pull | completed    duration=100ms
3:34PM INFO  actions.echo._simpleImage._dag."1"._exec | computing
3:34PM INFO  actions.echo._simpleImage._dag."1"._exec | completed    duration=0s
3:34PM INFO  actions.echo._exec | computing
3:34PM INFO  actions.echo._exec | completed    duration=100ms
3:34PM INFO  actions.echo._exec | #5 0.086 Hello World!
{}
```

## module の定義
- [universe.dagger.io/bash/bash.cue](cue.mod/pkg/universe.dagger.io/bash/bash.cue)
    - GitHub: [dagger/bash.cue at v0.2.23 · dagger/dagger](https://github.com/dagger/dagger/blob/v0.2.23/pkg/universe.dagger.io/bash/bash.cue)
- [universe.dagger.io/docker/run.cue](cue.mod/pkg/universe.dagger.io/docker/run.cue)
    - GitHub: [dagger/run.cue at v0.2.23 · dagger/dagger](https://github.com/dagger/dagger/blob/v0.2.23/pkg/universe.dagger.io/docker/run.cue)
