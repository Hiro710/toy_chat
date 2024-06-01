# What's App?

このアプリは現行のTOYBOX掲示板の機能アップバージョンです。

開発タスク・メモはGithubの[Wiki](https://github.com/Hiro710/toy_chat/wiki)参照。

ぼちぼち開発中。

# Getting Started

使用PCによる環境やツールの差異などによって引き起こされるトラブルを回避する為、Dockerを使用する。

その他、Dockerを使用する理由は以下である

- 開発環境の共有
- アプリケーション実行環境の確保
- 複数OSでアプリケーションの動作確認
- ローカル環境をできるだけ汚さずに済むなど、メリットが得られる為。

### 必要なツール

ローカル環境で動作させる場合

- Docker🐳：[こちら](https://www.docker.com/)から入手

- Docker Compose🐙：Dockerをインストールすると入っている

- Git：[こちら](https://git-scm.com/)から入手(開発に関わりたい人のみ必要)

基本ローカル環境で動かすのに必要なツールはDockerのみである。

アプリのリソースをgit cloneするかzip形式でダウンロード・解凍し、Dockerをインストール・起動すれば動かすことが可能。

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
