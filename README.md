# What's App?

このアプリはTOYBOX掲示板のパワーアップバージョンです。

現在開発中。

開発中につまづいた事や忘れがちな事などを[ここ](https://qiita.com/Hiro710/items/cd8c0c7fb1eae4a72ce5)にまとめる。

お店の運営者からの要望あり。(詳細は最下部)

# Getting Started

使用PCによる環境やツールの差異などによって引き起こされるトラブルを回避する為、Dockerを使用する。

その他、Dockerを使用する理由は以下である

- 開発環境の共有
- アプリケーション実行環境の確保
- 複数OSでアプリケーションの動作確認
- ローカル環境をできるだけ汚さずに済むなど、メリットが得られる為。

### 必要なツール

- Docker🐳：[こちら](https://www.docker.com/)から入手

- Docker Compose🐙：Dockerをインストールすると入っている

- Git：[こちら](https://git-scm.com/)から入手(開発に関わりたい人のみ必要)

基本ローカル環境で動かすのに必要なツールはDockerのみである。

アプリのリソースをzip形式でダウンロード・解凍し、Dockerをインストール・起動すれば動かすことが可能。

インストール方法は[Qiita](https://qiita.com/)や[Zenn](https://zenn.dev/)内で検索かけると出てくる。


### 起動(ビルド)方法

必要なツールのインストールが完了したら、デスクトップなど任意の場所で以下を順に実行。

**ターミナル(コマンドプロンプト)上で実行**

アプリの起動・停止などは[こちら](https://docs.docker.jp/compose/rails.html)を参考にして下さい。

```
# アプリケーションをダウンロード
$ git clone https://github.com/Hiro710/toy_chat.git

# フォルダへ移動
$ cd toy_chat

# DBの作成
$ docker-compose run web rake db:create

# アプリを起動 (-d:コンテナをバックグラウンドで起動させる為のオプション)、失敗する場合は-d無しで実行してみる
$ docker-compose up -d

# WebブラウザのURL欄に以下を入力(掲示板が表示されれば成功！)
localhost:3000

# アプリの停止
$ docker-compose down

# アプリの再起動
$ docker-compose run web rake db:create

$ docker-compose up -d

# アプリの開始・停止は以下でも可能(DB立ち上げ済みなのでこっちの方が早い)
$ docker-compose start
$ docker-compose stop
```

GemfileやDockerfileなどを修正した時だけビルドが必要。
ビルド後、上記コマンド「# DBの作成」から順に実行するとアプリが起動する。
以下はGemfileの内容変更時の例。

```
$ docker-compose run web bundle install
$ docker-compose build
```

#### Dockerを起動させずにDockerコマンド打つと以下のエラーを吐く

```
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```
**→ Dockerが起動しているか確認すること！**

# 課題

運用サービスどこ使う?

→ なるべく低コストで運用したい。

- AWS
- Netlify
- Heroku
- GCP
- Render → デバッグ・テストで使用
- etc...

正式リリースする前にベータ版としてリリースし、テストユーザに利用してもらい、day, week, month単位でアクセス数の計測、それによるリソースの負荷計測などを行う必要がある。

特に誤動作などのバグがないか、使用端末によってレイアウトが崩れてないかをベータ版リリース時に合わせてユーザに周知させる。


### 従来の機能


- 投稿：モバイル端末からのみ投稿可能(画像は2枚までアップ可能)

- 返信：2chの様な返信方法(レス番号)

- 検索：キーワード検索のみ対応

- (編集：あるようでないもの(パスワードが必要らしい))

- (投稿の削除：管理者のみ削除可能(たぶん))

- 画像表示時に各サイズが選択できるようになっている

### 目標とする機能 (未完了タスク)

- 検索：キーワード、日付、性別等で検索可能

- 投稿記事に対するリプライ機能(Xの様なリプライにすると見た目もクールになる)

- 画像のみを一覧表示 (優先度：低)

- 投稿の削除権限を運営(admin)のみに限定 → 誤投稿による再投稿で掲示板が繁雑になるのを避けたい(可能？)

- 画像アップは2枚までとし、サイズ選択をどうするかは今後検討の余地あり

 etc...

### 実装完了タスク

 - 投稿：モバイル端末からのみ投稿可能

**→ 投稿機能・投稿の一覧表示までは実装完了(モバイル限定にするかはまだ未定)**

- 投稿一覧の昇降順表示 (※ 検索ページに実装？、メインページに実装？、昇降基準は日付か投稿記事のインデックスか?)

**→ 投稿一覧ページの昇降順表示の実装完了**

- 投稿記事の編集

### 仕様 (バージョン)

* Ruby : 3.2.2

* Rails : 7.0.8 以上

* DB (PostgreSQL) : 1.1 以上

* Docker：24.0.6

# 参考にしたサイト

- [【初学者向け】DockerでRails7の環境構築（2023年版）](https://qiita.com/jibiking/items/fc7b0141af4b13a32ec3)

- [docker-composeでよく使うコマンド(Ruby on Rails)](https://qiita.com/LikeGeohotz/items/0e3cd9dfa67d7ff6ff96)


- [使えるRSpec入門・その1「RSpecの基本的な構文や便利な機能を理解する」](https://qiita.com/jnchito/items/42193d066bd61c740612)

以下は一部を参考にしたサイト(Dockerの各コマンドの概要など)

- [Docker公式クィックスタート: Compose と Rails](https://docs.docker.jp/compose/rails.html)

- [【入門】docker-compose up の使い方](https://www.kagoya.jp/howto/cloud/container/dockercomposeup/)

- [【入門】Dockerとは？概要やメリット、インストール方法をわかりやすく解説](https://www.kagoya.jp/howto/cloud/container/docker/)

- [イケてるレポジトリのREADME.mdには何を書くべきか](https://qiita.com/autotaker1984/items/bce70c8c67a8f6fb1b9d)

# その他課題

- 必要であれば、将来は英語版READMEを追加予定。

- UXを意識したUIの構築。

- テスト、リポジトリへのプッシュ、デプロイなどの自動化、CircleCIやJenkinsの使用を促す。

- 画面遷移状態図の作成。

- モックアップの作成。(優先度：中)

- ユーザー登録なしで気軽に使えるかつ、セキュリティ、フールプルーフの最適化。(優先度：高)

- 日本人向けに開発且つ開発自体に集中したい為、Gitのコミットメッセージは日本語で書く。(英語で書く必要が生じてきたら英語で書く様にする)

- day, week, month単位でアクセス数の計測、それによるリソースの負荷計測。(余力があれば実行。まずはリリースまでを目標に進める。)

- レイアウトをソレっぽい感じにしたい(軽量CSSフレームワークBULMA使ってみる)

- 余裕があれば24時間以内の投稿のみに色付け表示させる機能を追加する

- 各投稿にはidが振り分けられているが、index_idを付与した方が検索時の高速化やコメントとの紐付けがより良くなる可能性がある

- 各投稿に振り分けられているidはそのままURLにも表示されるのが現状で、セキュリティの観点からあまり良くない(uuidを取り入れるなどの対策が必要)

# お店の運営者からの要望

お店の運営者にはある程度本件に関して話済み。

運営者から「本文中などにメールアドレスを書き込めない様にしてほしい」とのこと。

→ 投稿・編集の送信時にフィルタリングしてはじくなどの対策が必要。

正規表現でマッチさせてはじくかもっと別の手法がないか調査・検討する。
