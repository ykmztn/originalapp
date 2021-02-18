# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| gender_id             | integer | null: false |
| age_id                | integer | null: false |

### Association

- has_many :poses
- has_many :comments


## poses テーブル

| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| title        | string     | null: false                     |
| effect_id    | integer    | null: false                     |
| minute       | integer    | null: false                     |
| intensity_id | integer    | null: false                     |
| user         | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル

| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| comment      | text       | null: false                     |
| user         | references | null: false, foreign_key: true  |
| pose         | references | null: false, foreign_key: true  |


# アプリケーション名
  Do Re: Me (ドレミ)  
  Do -> やる、Re: -> Relax, Refresh, Reset などのRe, Me -> 自分  
  ・自分に戻る時間の大切さを伝えたい。  
  ・音階のドレミとすることで手軽さ、簡単さを伝えたい。  

# アプリケーション概要  
  ・ヨガのポーズを登録し、自分ができるようになったポーズをメモとして写真や効果と一緒に記録できる。  
  ・時間を絞ったり、ピンポイントで効果を指定することで休憩中などの短い時間内でヨガができるようになる。  

# URL  
  https://originalapp-doreme.herokuapp.com/  

# テスト用アカウント  
  email    : 0216@email  
  password : password0216  

# 利用方法  
  トップページでは全てのユーザーによる投稿が閲覧できる。ただしそれ以外の機能はアカウントを持ったユーザーに限られるのでユーザー登録をする必要がある。  
  ユーザー登録が済んだユーザーはトップページより自分が検索したいポーズをポーズ名・効果・強度・所要時間で条件を指定し検索できる。何も条件を指定しなかった場合は全てのポーズが表示される。  
  
  My Pageでは新たにポーズの投稿を行うことができる。  

  一度ログアウトした場合はログイン画面より再度ログインする。  

# 目指した課題解決  
  ペルソナ設定  仕事に家事に忙しい20-30代女性  
  ・自分が習得したポーズを思い出したい時に見返すことができる。  
  ・英語の勉強をしたい -> 英語表記にしているため外国籍の方でも使用できる  
  ・短時間でヨガをしたい -> 検索機能を儲けることで今の自分の気分にあったヨガポーズをピックアップすることが可能  

# 洗い出した要件  
  *ユーザー登録機能 : ユーザー登録のため。ラジオボタンを用いてユーザーの登録の負荷を減らした。  
  *投稿機能 : 自分のヨガポーズを投稿するため。画像のプレビュー機能を追加し、ユーザーが新規投稿時に確認できるようにした。  
  *削除機能 : 自分の不要な投稿を削除するため。モーダルを用いて警告文を表示するようにした。  
  *検索機能 : ユーザーが欲しい情報をピンポイントで呼び出すことで、時間短縮を図るため。時間に関しては指定した時間以下のものが検索されるようになっている  
  *コメント機能 : ユーザー同士のコミュニケーションを図るため。  

# 実装した機能についてのGIFと説明  
  *ユーザー登録機能(ラジオボタン/エラー表示)
  https://gyazo.com/58acba3738829d58d3b21f1789e62de4  
  *投稿機能(プレビュー)  
  https://gyazo.com/575cd6d5bebf892f3dc3b01cf3c4ebe7  
  *削除機能(モーダル)  
  https://gyazo.com/901ffd835399ca7ec7244116ceddb76f  

# 実装予定の機能  
  *本番環境での画像のリンク切れを防ぐ実装  
  *コメント機能  
  *編集機能  
  *いいね機能  

# データベース設計
  https://user-images.githubusercontent.com/76562258/108312254-c290d880-71f9-11eb-92db-2b44aad3b1ac.mov

