# アプリケーション名
- artkey
# アプリケーション概要
- キーワードの検索情報取得および情報共有掲示板
# 企画背景
アフィリエイトをしていた経験から、キーワード1つで必要な情報を取得できれば圧倒的な効率化が実現可能だと思い、企業や個人選ばず、誰でも利用できるサービスを作ることにしました。
# アプリケーションURL
- https://artkey.herokuapp.com/  (※heroku)
- http://54.249.134.64/  (※aws)
# テスト用アカウント
- ゲストログイン機能実装済みです。
# 利用方法
- 「キーワード情報を取得する」のフォームに検索キーワードを入力して「取得」ボタンをクリックすると情報が取得できます。
※まだ機能が完全ではなく一部のキーワードではエラーが表示されてしまいますので、例として「テックキャンプ 体験談」を入力してみてください。
- 「情報共有ページはこちら」をクリックし、テキストフォームにメッセージを入力して「投稿」をクリックします。
- 「画像」をクリックしてアップロードしたい画像を選択して「投稿」をクリックします。
# 目指した課題解決
- 情報収集時間の工数削減。
- SEO対策の効率化。

# 工夫したポイント
スクレイピング技術として「selenium」を使用し、キーワードを入力すれば自動でgoogleが立ち上がり、検索結果をクロールしてそれぞれの記事情報を取得していたが、20日ほど経過した時にそもそもgoogleにクローラーを回すことが違反であることを知りました。

なので、「google custom search api」を使って情報を取得する方向にシフトし、簡単な情報であれば取得することに成功しました。

また、情報共有広場という名の”誰でも書き込むことができる掲示板”のようなものを作成しました。

なお、画像も投稿・閲覧することが可能で、長い文章を表示させるためのスクロール機能も実装済みです。

# 洗い出した要件
- ログイン機能
- API機能の導入
- スクレイピングに必要な「nokogiri」の導入
- 記事タイトル・記事URL・見出し・文字数・公開日&更新日の表示
- テキスト投稿機能
- 画像投稿機能

# 使用技術
- スクレイピング

# 開発環境
- HTML/CSS/Ruby/Ruby on Rails/JavaScript

# 実装した機能についてのGIFと説明
- https://gyazo.com/0b2f089810340dec2ab99f3a34cc051b
ユーザー登録やパスワードの入力作業の手間を解決するため。
- https://gyazo.com/98a6e9d936ee436af2be96c55c8ad562
任意の検索ワードを入力して取得をクリックすることで、取得したキーワードの情報が表示されます。
-  https://gyazo.com/247e8eea07276922433a32003583504a
テキストフォームにメッセージを入力し、必要であれば画像を選択して投稿をクリックすれば表示されます。

# 実装予定の機能
- キーワードの月間検索ボリューム、キーワード完全一致検索後の記事数、APIを用いたロングテールキーワードなどの情報取得機能。
- 「ransack」を用いた検索機能。

# データベース設計
- https://gyazo.com/9435d507c07453ec340d0442eaf86918

# テーブル設計

## users テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| nickname              | string     | null: false |
| email                 | string     | null: false |
| encrypted_password    | string     | null: false |
| test_image            | string     | null: false |
| profile_text          | text       | null: false |
| first_name            | string     | null: false |
| last_name             | string     | null: false |
| first_name_kana       | string     | null: false |
| last_name_kana        | string     | null: false |

### Association

- has_many :messages
- has_many :chats
- has_many :entries
- has_many :rooms, through: :entries

## affiliates テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| affiliates  | string     | null: false                    |

### Association

## messages テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| messages    | text       | null: false                    |

### Association

- belongs_to :user

## entries テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| room        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## rooms テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |

### Association

- has_many :chats
- has_many :entries
- has_many :users, through: :entries

## chats テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| room        | references | null: false, foreign_key: true |
| chat        | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :room