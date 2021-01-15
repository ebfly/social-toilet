# README

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
