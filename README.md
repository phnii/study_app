# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

モデル設計
・User(email, hashed_password, admin) has_many articles
・Article(title, content, created_at, user_id) belongs_to :user

画面
・トップ画面（記事一覧）
・ログイン画面
・記事詳細画面
・ユーザー管理画面
・新規記事投稿画面
・記事編集画面

その他機能
・ログアウト
・記事削除
・ユーザーパスワード変更
・マークダウン対応
・bootstrap対応


参考一覧
ブートストラップ適用
https://qiita.com/beanzou/items/4f49d4d63776234cc992