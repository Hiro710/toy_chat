# What's App?

このアプリはTOYBOX掲示板のパワーアップバージョンです。
現在開発中。

# Getting Started

使用PCによる環境やツールの差異などによって引き起こされるトラブルを回避する為、Dockerを使用する。

開発環境の共有、アプリケーション実行環境の確保、複数OSでアプリケーションの動作確認、ローカル環境をできるだけ汚さずに済むなど、メリットが得られる為。

### 必要なツール

- Git：[こちら](https://git-scm.com/)から入手

- Docker🐳：[こちら](https://www.docker.com/)から入手

- Docker Compose🐙：Dockerをインストールすると入っている

### ビルド方法

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

# アプリを起動
$ docker-compose up

# WebブラウザのURL欄に以下を入力(掲示板が表示されれば成功！)
localhost:3000

# アプリの停止
$ docker-compose down

# アプリの再起動
$ docker-compose run web rake db:create

$ docker-compose up
```

GemfileやDockerfileなどを修正した時だけビルドが必要。
ビルド後、上記コマンド「# DBの作成」から順に実行するとアプリが起動する。

```
$ docker-compose build
```

# 課題

運用サービスどこ使う?

- AWS
- Netlify
- Heroku
- GCP
- Render
- etc...

### 従来の機能

以下の2つ

- 投稿：モバイル端末からのみ投稿可能

- 検索：キーワード検索のみ対応

### 目標とする機能

- 投稿：モバイル端末からのみ投稿可能 **(※ 議論の余地あり)**

- 検索：キーワード、日付、性別等で検索可能

- 投稿記事の昇降順表示 **(※ 検索ページに実装？、メインページに実装？)**

- 投稿記事に対するリプライ機能

- 画像のみを一覧表示

- 投稿した記事の編集

- 投稿の削除権限を運営(admin)のみに限定 → 誤投稿による再投稿で掲示板が繁雑になるのを避けたい

 etc...

### 仕様

* Ruby version : 3.2.2

* Rails version : 7.0.8 以上

* Database(PostgreSQL) : 1.1 以上

* Docker version：24.0.6

# 参考にしたサイト

- [【初学者向け】DockerでRails7の環境構築（2023年版）](https://qiita.com/jibiking/items/fc7b0141af4b13a32ec3)

- [docker-composeでよく使うコマンド(Ruby on Rails)](https://qiita.com/LikeGeohotz/items/0e3cd9dfa67d7ff6ff96)


以下は一部を参考にしたサイト(Dockerの各コマンドの概要など)

- [Docker公式クィックスタート: Compose と Rails](https://docs.docker.jp/compose/rails.html)

- [【入門】docker-compose up の使い方](https://www.kagoya.jp/howto/cloud/container/dockercomposeup/)

- [【入門】Dockerとは？概要やメリット、インストール方法をわかりやすく解説](https://www.kagoya.jp/howto/cloud/container/docker/)

- [イケてるレポジトリのREADME.mdには何を書くべきか](https://qiita.com/autotaker1984/items/bce70c8c67a8f6fb1b9d)

# その他課題

必要であれば、将来は英語版READMEを追加予定。

文章量が大量になってきたらGithub Wikiへ移動させる。
しかし、Wikiを使うには、リポジトリをパブリックにする必要がある。

UXを意識したUIの構築。

テスト、リポジトリへのプッシュ、デプロイなどの自動化。
