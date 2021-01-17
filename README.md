# SocialToilet
全国のトイレの場所や情報を共有するアプリケーション

![トップページ](https://i.gyazo.com/cfe7d2dc02aa94cf89aa0fee88bc7624.jpg)

# 概要
観光などで訪れる地域のトイレ事情を知りたい人や、育児中の親御様、快適にトイレを使いたい人に向けて
トイレの情報、場所を投稿する

# App URL

# 利用方法
・トップページから新規登録もしくはログイン
・画面右下の投稿画面へ遷移する
・投稿内容のトイレ情報を入力して投稿
・トップページに一覧が表示される
・投稿をクリックしたら、トイレの詳細画面へ遷移する

# 課題解決

# 機能一覧

# 追加予定機能

# ローカルでの動作方法
git clone https://github.com/ebfly/social-toilet.git
cd social-toilet
bundle install
rails db:create
rails db:migrate
rails s

# 開発環境
VScode
Ruby 2.6.5
Rails 6.0.0
mysql2 0.4.4
JavaScript
gem 
heroku 

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
| user            | references  | null: false,  foreign_key true |

  ### Association 
  - belongs_to :user
