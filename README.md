# SocialToilet
全国のトイレの場所や情報を共有するアプリケーション

![トップページ](https://i.gyazo.com/cfe7d2dc02aa94cf89aa0fee88bc7624.jpg)

# 概要
観光などで訪れる地域のトイレ事情を知りたい人や、育児中の親御様、快適にトイレを使いたい人に向けて
トイレの情報、場所を投稿する

# App
[SocialToiletへ遷移します](https://www.social-toilet.com/)※3/10現在エラーにより復旧作業中です。

# AWS構成図
[![Image from Gyazo](https://i.gyazo.com/b3f8cdbdaf8ede5df47de2ef5b7526cb.png)](https://gyazo.com/b3f8cdbdaf8ede5df47de2ef5b7526cb)

# 利用方法
・トップページから新規登録もしくはログイン
・画面右下の投稿画面へ遷移する
・投稿内容のトイレ情報を入力して投稿
・トップページに一覧が表示される
・投稿をクリックしたら、トイレの詳細画面へ遷移する

# 課題解決・追加したい機能
  * 都道府県別の投稿検索機能
  * マイページ表示の実装

# 機能一覧
 * ユーザー機能
  * ユーザー新規登録・ログイン機能
  * SNS認証ログイン(Google)
  * ゲストログイン
  * ユーザー情報編集機能
 * 投稿機能
  * 新規投稿機能(投稿時にGoogleMapAPIを用いた位置情報詳細を表示・保存),
  (画像投稿用にGem: ActiveStorageを使用)
  ![地図表示](https://i.gyazo.com/37a677ce3c2295e385d0236e2b7b4fb3.gif)
  * 投稿詳細表示
  ![保存した投稿・地図表示](https://i.gyazo.com/b046aa41f4d15b5655e5dcf9bda77fc4.gif)
  * 投稿編集機能
  * 投稿削除機能
 * テスト機能
  * RSpec/Rubocopテスト機能
  * エラーメッセージの日本語化 
  * モデルに対するバリデーション・正規表現

# ローカルでの動作方法
 * git clone https://github.com/ebfly/social-toilet.git
 * cd social-toilet
* bundle install
* rails db:create
* rails db:migrate
* rails s

# 使用技術
* VScode
* HTML/CSS
* Ruby 2.6.5
* Rails 6.0.0
* JavaScript
* mysql 5.6.50
* Linux
* Nginx(Web Sever)
* Unicorn(Application Server)
* Docker 20.10.0
* docker-compose 1.27.4
* CircleCI(CI/CD)
* Capistrano
* AWS EC2 (Amazon Linux2)/RDS(MariaDB)/S3/IAM
* AWS(ACM,Route53,ALB)
* Google Cloud Platform(GoogleMapAPI),SNS認証
* Git/GitHub(pull request,Issue 等による擬似チーム開発)

# DB設計
## users テーブル

| Column                  | Type     | Options     |
| --------------------    | -------  | ----------- |
| nickname                | string   | null: false |
| email                   | string   | null: false |
| encrypted_password      | string   | null: false |
| prefecture_id           | integer  | null: false |
| city                    | string   | null: false |

  ### Association
  - has_many   :toilet
  - belongs_to :prefecture


## toilet テーブル
※imageはActiveStorage

| Column          | Type        | Options                        |
| ------------    | ---------   | ----------------------------   |
| name            | string      | null: false                    |
| text            | text        | null: false                    |
| category_id     | integer     | null: false                    |
| condition_id    | integer     | null: false                    |
| useful_id       | integer     | null: false                    |
| multi_id        | integer     | null: false                    |
| address         | string      | null: false                    |
| latitude        | float       | null: false                    |
| longitude       | float       | null: false                    |
| user            | references  | null: false,  foreign_key true |

  ### Association 
  - belongs_to :user
