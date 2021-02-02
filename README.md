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
| effect_id    | string     | null: false                     |
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