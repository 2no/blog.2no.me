+++
date = "2016-08-13T10:10:18+09:00"
slug = ""
tags = ["ssl", "security", "github"]
title = "カスタムドメインな Github Pages を超簡単に SSL 化してくれる Kloudsec がサービス終了していた件"

+++

当ブログは Github Pages で公開して Kloudsec で SSL 化していたが、その Kloudsec が知らぬ間にサービス終了していた。  
どうやら 8/1 にサービス終了していたらしい。

詳しくは以下に載っている。  
[Got an email saying that Kloudsec will be shutting down Aug 1st. : webdev](https://www.reddit.com/r/webdev/comments/4s3kmf/got_an_email_saying_that_kloudsec_will_be/)

サービス終了の理由は、大体こんな感じ？

* 維持費用は自腹で出してきた
* 維持費用は $10000/month 以上と高価
* Kloudsec では資金を稼げない

現時点では移行期間が設けられているのか、連携しているドメインはまだ使える様子

## 移行先

できるだけお金を使わずに簡単に済ますなら CloudFlare という選択肢があるが、ネームサーバを変更するのが手間だったので、今回は自分が運用しているサーバに Let's Encrypt の SSL 証明書を入れ、nginx で Github Pages をリバースプロキシして対応した。

↓ nginx の設定は以下を参考
<script src="https://gist.github.com/taddev/8872330.js"></script>

これらの設定のうち、`proxy_set_header Host $host;` があると github.io の 404 ページが表示されるので削除した。
