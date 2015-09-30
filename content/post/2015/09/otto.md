+++
date = "2015-09-30T14:48:22+09:00"
draft = true
title = "Windows 環境下で otto が正しく機能しない"

+++

[otto](http://ottoproject.io) とは、最近 HashiCorp から発表されたプロダクト。  
早速試してみたのだが、環境によってうまく動かない場合があった。

▼環境  
Windows 10  
Cygwin  
otto 0.1.1

▼ディレクトリ構成・ファイル内容

```
project
├── Appfile [*1]
└── mongodb
    ├── .ottoid
    └── Appfile [*2]
```

*1 /project/Appfile

```
application {
  name = "example"
  type = "ruby"

  dependency { source = "./mongodb" }
}

customization "ruby" {
  ruby_version = "2.0"
}
```

*2 /project/mongodb/Appfile

```
application {
    name = "mongodb"
    type = "docker-external"
}

customization "docker" {
    image = "mongo:3.0"
    run_args = "-p 27017:27017"
}
```

▼コンパイル実行結果

```
$ otto compile
==> Loading Appfile...
==> Fetching all Appfile dependencies...
    Fetching dependency: file://C:/Users/hoge/project/mongodb
    Error compiling Appfile: error downloading module 'file://C:/Users/hoge/project/mongodb': symlink C:\Users\hoge\project\mongodb C:\Users\hoge\project\.otto\appfile\deps\xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx: A required privilege is not held by the client.
```

`file://` となっているのが原因かはわからないが、linux 上で実行すると `file:///` なり、エラーは起きない
