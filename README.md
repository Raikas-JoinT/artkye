# テーブル設計b

## users テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| encrypted_password    | string     | null: false |

### Association

- has_many :affiliates

## affiliates テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| affiliates  | string     | null: false                    |

### Association

- belongs_to :user

## messages テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| messages    | text       | null: false                    |

### Association

- belongs_to :user