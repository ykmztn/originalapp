![f495d95e99a2fbc5d1be04df9c8b5625](https://user-images.githubusercontent.com/76562258/108347800-4fe92280-7224-11eb-8a3c-17477b538a75.gif)

# アプリケーション名
  Do Re: Me (ドレミ)  
   Do -> やる  
   Re: -> Relax(リラックス) / Refresh(リフレッシュ) /  Reset(リセット) / Resolve（解決する） などのRe  
   Me -> 自分  
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
  ペルソナ設定  仕事に家事に忙しい20-30代女性。海外旅行が好きで英語を勉強中。  
  ・自分が習得したポーズを思い出したい時に見返すことができる。  
  ・英語の勉強をしたい -> 英語表記にしているため外国籍の方でも使用できる  
  ・短時間でヨガをしたい -> 検索機能を儲けることで今の自分の気分にあったヨガポーズをピックアップすることが可能  

# 洗い出した要件  
  *ユーザー登録機能 : ユーザー登録のため。ラジオボタンを用いてユーザーの登録の負荷を減らした。  
  *投稿機能 : 自分のヨガポーズを投稿するため。画像のプレビュー機能を追加し、ユーザーが新規投稿時に確認できるようにした。  
  *削除機能 : 自分の不要な投稿を削除するため。モーダルを用いて警告文を表示するようにした。  
  *検索機能 : ユーザーが欲しい情報をピンポイントで呼び出すことで、時間短縮を図るため。時間に関しては指定した時間以下のものが検索されるようになっている  
  *いいね機能 : コメントは残さず、煩わしいコミュニケーションを回避するため自分が良いと思った投稿にワンタッチでリアクションだけする。

# 実装した機能についてのGIFと説明  
  *ユーザー登録機能(ラジオボタン/エラー表示)  
  ![ad70f3171165dc332673c5ec214a5933](https://user-images.githubusercontent.com/76562258/108447504-54a0eb80-72a3-11eb-86ed-bcb4017e65f6.gif)
<br>
  *投稿機能(プレビュー)  
  ![475231fa435d18921238d7091fccc794](https://user-images.githubusercontent.com/76562258/108447282-f411ae80-72a2-11eb-80b2-1fb02a4086d2.gif)  
<br>
  *削除機能(モーダル)  
  ![36177531b3c4f58d5802d601548c970e](https://user-images.githubusercontent.com/76562258/108447017-7e0d4780-72a2-11eb-9cdd-2b43b4fc2d35.gif)  


# 実装予定の機能  
  *本番環境での画像のリンク切れを防ぐ実装  
  *編集機能  


# データベース設計  
  ![image](https://user-images.githubusercontent.com/76562258/108449322-9da66f00-72a6-11eb-94a6-0deaf6cb5f30.png)  

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
- has_many :likes


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
- has_many :likes


## likes テーブル

| Column       | Type       | Options                         |
| ------------ | ---------- | ------------------------------- |
| user_id      | references | null: false, foreign_key: true  |
| pose_id      | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :pose