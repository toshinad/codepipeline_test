# インフラ環境

## 概要

- Ubuntu上にdockerベースの環境を構築する想定です。
- Ubuntuのバージョンは最新のLTS18.04が比較的最近でたタイミングなので、一世代前の16.04を使います。
- 構成管理はansibleでやります。

## 残件
- Credential管理
  - どこに置くか,なにで管理するか,キーなどの更新どうするか
- DB
  - 今はDockerで動かしているがそのうち変える？
  - これもCredentialあり
  - マイグレーション
- 本番
  - 踏み台とか監査周りは本社に任せたい
  - ログ、監視とかも
  - コンテナのオーケストレーター決めたい
  - EKS使えればEKS。リリース間に合わないならとりあえずECSかFargateかにしてそのうち移行。
  - Fargate使うのはコンプラ的に大丈夫か？
  - 本番用イメージどうしようか node_modulesやvendor以下含むイメージにする？
  - DB、RedisはManagedの何か


## 開発環境構築手順

- ubuntu16.04のインスタンスを起動
- インスタンスにログイン
- リポジトリをclone
```
$ git clone git@github.com:3minute/00_environment.git
```
- branch切り替え いまはfeatureですがdevelopとか
```
$ cd 00_environment
$ git checkout feature/laravel_test
```
- 構築スクリプトがあるディレクトリに移動
```
$ cd /home/ubuntu/00_environment/infra/ansible
```
- ansibleインストール
```
$ sudo bash ./install_ansible.sh
$ ansible --version
```
- ansibleのPlaybook実行
```
$ ansible-playbook -i ubuntu-local docker-debian.yml
```
- バージョン確認
```
$ docker -v
Docker version 18.03.1-ce, build 9ee9f40
$ docker-compose --version
docker-compose version 1.21.2, build a133471
$ npm -v
5.6.0
```


## アプリのビルド、デプロイ
あまりサーバに入りたくないので、いずれCodeDeployで配備します(準備中)。

credentialの管理方法は検討中。

とりあえず手動で動かすには以下のようにします。

アプリは/opt/app以下に配備します。

- アプリ配備先へ移動
```
$ cd /opt/app
```
- オーナーがubuntuのディレクトリを作成
```
$ sudo mkdir work; sudo chown ubuntu work
```
- アプリをclone
```
$ cd /opt/app/work
$ git clone git@github.com:3minute/00_environment.git
```
- ブランチ切り替え
```
$ cd 00_environment
$ git checkout feature/laravel_test
```
- dockerディレクトリへ移動
```
cd docker
```
- key.txtを手動で作成：Credential管理方法が決まったら自動化
- デプロイ用ディレクトリへ移動
```
$ cd ../infra/deploy
```
- uiとDocker環境のビルド: DBのマイグレーションやキーの生成の手順入れていないので、サーバー側はまだエラーになります。
```
$ bash ./setup.sh
```
- composer installが終わるのを待つ
```
$ sudo docker logs -f docker_httpd-php_1
```
- 終わったらブラウザでアクセス
  - サーバ側：Laravelのエラー画面が出ます
    - http://HOSTのIP:8000
  - UI
    - http://HOSTのIP:8000/admin
