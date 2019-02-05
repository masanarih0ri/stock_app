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

# 基本的な仕様

### TOPページ

* アプリケーションの概要がわかる
* ログインと新規登録ができる

### データ登録ページ

* 四季報のデータが登録できる
*

### データ詳細ページ

* 登録したデータの内容を閲覧することができる
* 登録したデータの編集ボタンと削除ボタンがあり、それらを押すと指定の作業（登録、削除ができる）
* 複数のデータを呼び出して、データ比較をすることができる

### データ編集ページ

* データの内容を編集できる

### データ削除ページ

* 見た目としては存在しないが、ここのページに行って正常に処理が行われた場合は、論理削除するようにする。

### その他

* ユーザーごとに閲覧できるページが限られる
* adminユーザーはなんでも見れる

### DB構成

Userテーブル
ユーザー名 : user_name string
パスワード : password_digest string

Stockテーブル

ID（登録番号） : id  必須 PRIMARY NOT NULL
銘柄番号: stock_code:integer
銘柄名 : stock_name:string 必須
登録した年度 : registered_year:integer
登録した月 : registered_month:integer
今期PER : per:float
今期PBR : pbr:float
自己資本比率 : capital_adequacy_ratio:float
前期売上 : last_year_sales:integer
今期売上予測 : this_year_sales:integer
来期売上予測 : next_year_sales:integer

前期営業利益 : last_year_sales_profit:integer
今期営業利益予測 : this_year_sales_profit:integer
来期営業利益予測 : next_year_sales_profit:integer

前期純利益 : last_year_net_profit:integer
今期純利益予測 : this_year_net_profit:integer
来期純利益予測 : next_year_net_profit:integer

前期1株利益 : last_year_eps:float
今期1株利益 : this_year_eps:float
来期1株利益 : next_year_eps:float

前期配当 : last_year_dividend:float
今期配当 : this_year_dividend:float
来期配当 : next_year_dividend:float
配当利回り : this_year_dividend_yield:float
コメント: comment:text

登録日時 : created_at timestamp
更新日時 : updated_at timestamp
