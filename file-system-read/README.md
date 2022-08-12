# file-system-read
リポジトリ内のファイルにreadアクセスする

## 実行
```
dagger --log-format=plain do lsCat
```

### 実行結果
```
$ dagger --log-format=plain do lsCat
4:48PM INFO  client.filesystem.".".read | computing
4:48PM INFO  actions.lsCat.script._write | computing
4:48PM INFO  actions.lsCat._simpleImage._dag."0"._pull | computing
4:48PM INFO  actions.lsCat.script._write | completed    duration=0s
4:48PM INFO  client.filesystem.".".read | completed    duration=0s
4:48PM INFO  actions.lsCat._simpleImage._dag."0"._pull | completed    duration=100ms
4:48PM INFO  actions.lsCat._simpleImage._dag."1"._exec | computing
4:48PM INFO  actions.lsCat._simpleImage._dag."1"._exec | completed    duration=0s
4:48PM INFO  actions.lsCat._exec | computing
4:48PM INFO  actions.lsCat._exec | completed    duration=200ms
4:48PM INFO  actions.lsCat._exec | #7 0.102 $ pwd
4:48PM INFO  actions.lsCat._exec | #7 0.102 /workdir42
4:48PM INFO  actions.lsCat._exec | #7 0.102 $ ls -la ./
4:48PM INFO  actions.lsCat._exec | #7 0.103 total 12
4:48PM INFO  actions.lsCat._exec | #7 0.103 drwxr-xr-x    1 root     root          4096 Aug 12 07:48 .
4:48PM INFO  actions.lsCat._exec | #7 0.103 drwxr-xr-x    1 root     root          4096 Aug 12 07:48 ..
4:48PM INFO  actions.lsCat._exec | #7 0.103 -rwxr-xr-x    1 root     root            23 Aug 12 07:36 hello.txt
4:48PM INFO  actions.lsCat._exec | #7 0.104 $ cat "./hello.txt"
4:48PM INFO  actions.lsCat._exec | #7 0.105 Hello World
4:48PM INFO  actions.lsCat._exec | #7 0.105 foo
4:48PM INFO  actions.lsCat._exec | #7 0.105 bar
{}
```

## module の定義
- [universe.dagger.io/bash/bash.cue](cue.mod/pkg/universe.dagger.io/bash/bash.cue)
    - GitHub: [dagger/bash.cue at v0.2.23 · dagger/dagger](https://github.com/dagger/dagger/blob/v0.2.23/pkg/universe.dagger.io/bash/bash.cue)
- [universe.dagger.io/docker/run.cue](cue.mod/pkg/universe.dagger.io/docker/run.cue)
    - GitHub: [dagger/run.cue at v0.2.23 · dagger/dagger](https://github.com/dagger/dagger/blob/v0.2.23/pkg/universe.dagger.io/docker/run.cue)
- [dagger.io/dagger/plan.cue](cue.mod/pkg/dagger.io/dagger/plan.cue)
    - GitHub: [dagger/plan.cue at v0.2.23 · dagger/dagger](https://github.com/dagger/dagger/blob/v0.2.23/pkg/dagger.io/dagger/plan.cue)
