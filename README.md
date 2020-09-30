# テーブル設計b

## users テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| encrypted_password    | string     | null: false |
| first_name            | string     | null: false |
| last_name             | string     | null: false |
| first_name_kana       | string     | null: false |
| last_name_kana        | string     | null: false |
| birthday              | date       | null: false |

### Association

- has_many :affiliates

## affiliates テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| affiliates  | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user