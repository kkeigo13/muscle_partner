# 仕様書
## 1, サービス名
muscle partner

#### 1-1 コンセプト
- ジムに通うほど時間に余裕がないが身体を鍛えたいと考えている人が、セルフモチベーティングするためのアプリ。

#### 1-2 ターゲットユーザー
- ジムに通う時間のない30代の男性会社員。

#### 1-3 解決する問題
- 一人で筋トレを行うことによるモチベーションの低下を防ぐ。
- 自分の筋トレを記録として残すことで成果を可視化できる。

#### 1-4 例
-

#### 1-5 見本サイト


#### 1-6 使用するBootstrap
今回は未使用

#### 1-7 拡張案


## 2, 見積り工数
- 期間

| 実装箇所 | 期間 |
|---|---|
| `フロントエンド` |４日|
| `バックエンド` |７日|
| `サーバーデプロイ` ||
| `フロントエンドとバックエンドのつなぎ` ||
| `予備日` ||

合計：？？？日


##3, UI設計

◯ユーザー側UI(3枚)
- タイムライン
- マイページ

■バックエンド機能
機能部分
ユーザー関連(10日)
- 登録, 編集, 削除
- ログイン機能(1日)
- 筋トレメニューの追加機能

## テーブル設計

### Users

|column|説明|type|default|null|備考|
|---|---|---|---|---|---|
| `uuid` | 紐づくユーザーのID | references |  | false | |
| `nick_name` | ニックネーム | string |  | false | |
| `mail_adress` | メールアドレス | text | | false | |
| `pass_word` | パスワード | string | | false | |

- 関連
  - `has_many :menus`
  - `has_many :tweets`

### Menus
| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `user_id` | 紐づくUserのid | references | | false | |
| `icon_image` | アイコン画像 | string | | true | |
| `name` | メニュー名 | string | | false | |
| `unit` | 単位 | string | | false | |


- 関連
  - `belongs_to :users`


### Tweets

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `user_id` | 紐づくUserのid | references | | false | |
| `menu` | メニュー | string |  | false | |
| `value` | 投稿されたメニューの値 | integer | | false | |
| `remarks` | 備考 | text | | true | |


- 関連
  - `belongs_to :user`
