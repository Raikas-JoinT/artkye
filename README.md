# アプリケーション名
- artkey
# アプリケーション概要
- キーワードの検索情報および情報共有掲示板
# URL
https://artkey.herokuapp.com/
# テスト用アカウント
- ゲストログイン機能実装済み
# 利用方法
- 「キーワード情報を取得する」のフォームに検索キーワードを入力して「取得」ボタンをクリックすると情報が取得できます。
- 「情報共有ページはこちら」をクリックし、テキストフォームにメッセージを入力して「投稿」をクリック。
- 「画像」をクリックしてアップロードしたい画像を選択して「投稿」をクリック。
# 目指した課題解決
- 情報収集時間の工数削減。
- SEO対策の効率化。

# 洗い出した要件
- ログイン機能
- API機能の導入
- スクレイピングに必要な「nokogiri」の導入
- 記事タイトル・記事URL・見出し・文字数・公開日&更新日の表示
- テキスト投稿機能
- 画像投稿機能

# 実装した機能についてのGIFと説明
- https://gyazo.com/0b2f089810340dec2ab99f3a34cc051b
ユーザー登録やパスワードの入力作業の手間を解決するため。
- https://gyazo.com/98a6e9d936ee436af2be96c55c8ad562
任意の検索ワードを入力して取得をクリックすることで、取得したキーワードの情報が表示される。
-  https://gyazo.com/247e8eea07276922433a32003583504a
テキストフォームにメッセージを入力し、必要であれば画像を選択して投稿をクリックすれば表示される。

# 実装予定の機能
- キーワードの月間検索ボリューム、キーワード完全一致検索後の記事数、APIを用いたロングテールキーワード情報の取得など。

# データベース設計
- https://gyazo.com/9435d507c07453ec340d0442eaf86918

# テーブル設計

## users テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| encrypted_password    | string     | null: false |

### Association

- has_many :affiliates
- has_many :messages

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