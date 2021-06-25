# README

### 製品名

POMOTAS(ポモタス)

---

### 製品概要

以前、自身でもポモドーロアプリやタスク管理アプリは使っていましたが、
両方の機能を実装しているアプリに出会っていませんでした。
その為、それぞれで使い分けをしていましたが使い分けが面倒になってしまい、結果使わなくなってしまっていました。
そこで、「タスク管理とポモドーロを 1 つにして設定したタスク(学習や業務)をより効率的に管理できるアプリを作りたい！！」
と思いこのアプリを作成しました。

---

### 開発言語

ruby2.6.5<br>
rails 5.2.6<br>
postgresql 13.2<br>

---

### 機能一覧

ユーザー登録機能<br>
ログイン機能<br>
ゲストログイン機能<br>
CRUD 機能<br>
ポモドーロ機能<br>
ページネーション機能<br>

---

### 就業 Term の技術

devise<br>
Ajax(タスクに対してのコメント機能))<br>

---

### カリキュラム外の技術

※随時追加予定<br>
ransack(タスクの絞り込み検索)<br>

---

### 実行手順

```
$ git clone https://github.com/toshi32/pomotas.git
$ cd pomotas
$ bundle install
$ rails db:create && rails db:migrate
$ rails s
```

### カタログ設計

https://docs.google.com/spreadsheets/d/1Hs_ej1uZPlUCOPPOoWfmwZkjqyNtIBdTP5mFtgZ7oWY/edit#gid=1408908229

---

### table 定義

https://docs.google.com/spreadsheets/d/1Hs_ej1uZPlUCOPPOoWfmwZkjqyNtIBdTP5mFtgZ7oWY/edit#gid=942065432

---

### ワイヤーフレーム

https://cacoo.com/diagrams/NVZFzEG3iT6DweaO/581BE

---

### ER 図

https://cacoo.com/diagrams/uPjSWoyriFqMupRE/B100F

<img width="356" alt="ER図(Ver 5)" src="https://user-images.githubusercontent.com/79957027/122858094-a42c1c80-d354-11eb-8c7f-cacc00c656d5.png">

---

### 画面遷移図

https://docs.google.com/spreadsheets/d/1Hs_ej1uZPlUCOPPOoWfmwZkjqyNtIBdTP5mFtgZ7oWY/edit#gid=1881857828

<img width="639" alt="画面遷移図(Ver 3)" src="https://user-images.githubusercontent.com/79957027/122197173-e4ae1500-ced2-11eb-8eb5-200534ef56b0.png">
