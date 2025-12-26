# HelpHub

<div align="center">

**悩みや孤独を抱える人たちが、お互いに支え合うことのできるリアルタイム相談掲示板**

[![Rails](https://img.shields.io/badge/Rails-8.0.2-red.svg)](https://rubyonrails.org/)
[![Ruby](https://img.shields.io/badge/Ruby-3.4.5-red.svg)](https://www.ruby-lang.org/)

[デモサイト](#) | [ドキュメント](#) | [バグ報告](https://github.com/p-pepe/help_hub/issues)

</div>

---

## 目次

- [概要](#概要)
- [主な機能](#主な機能)
- [デモ](#デモ)
- [技術スタック](#技術スタック)
- [セットアップ](#セットアップ)
- [使い方](#使い方)
- [開発](#開発)
- [テスト](#テスト)
- [デプロイ](#デプロイ)
- [今後の予定](#今後の予定)
- [貢献](#貢献)
- [ライセンス](#ライセンス)
- [作者](#作者)

---

## 概要

HelpHubは、誰かに話したいけど気軽に話せる人がいない、深夜に悩みを抱えがちな人、匿名で感情を出したい人のための相談掲示板です。

### コンセプト

- 温かい空間: 投稿やコメントを通じて、人と人がつながる場所
- 匿名OK: 本名を明かさずに相談できる安心感
- 24時間オープン: 深夜でもふと立ち寄れる場所
- 寄り添う体験: 天気や気分などの外部要素とも連動（将来実装予定）

### 開発目的

このプロジェクトは以下の目的で開発されています：

- Rails 8の最新機能習得
- ゼロからのアプリ設計・実装・リリース経験
- ポートフォリオとしての活用
- Hotwire (Turbo + Stimulus) の実践

---

## 主な機能

- **ユーザー認証**
  - 新規登録・ログイン・ログアウト
  - プロフィール編集（ニックネーム、誕生日、性別、自己紹介）
  - アバター画像アップロード

- **投稿機能**
  - 投稿の作成・編集・削除
  - ステータス管理（下書き・公開・アーカイブ）
  - タグによる分類

- **コメント機能**
  - 投稿へのコメント
  - リアルタイム更新（Turbo Streams）

- **タグ機能**
  - タグによる投稿の絞り込み
  - 人気タグの表示

- **マイページ**
  - 自分の投稿一覧
  - プロフィール表示

### 今後の予定

- いいね機能
- ブックマーク機能
- キーワード検索
- コメントの編集・削除機能
- リアルタイム通知（Action Cable）
- ユーザーフォロー機能
- 外部API連携（天気、気分記録）
- マークダウンエディタ
- ハッシュタグ機能

---

## デモログイン

- メールアドレス: `demo@example.com`
- パスワード: `password`

※ 投稿・編集・削除などは自由にお試しください。
  定期的にデモデータはリセットされる可能性があります。

### デモサイト

[https://help-hub.onrender.com](#)（準備中）

### スクリーンショット

<div align="center">

| トップページ | 投稿詳細 |
|:---:|:---:|
| ![トップページ](docs/images/home.png) | ![投稿詳細](docs/images/post-detail.png) |

| マイページ | 投稿作成 |
|:---:|:---:|
| ![マイページ](docs/images/mypage.png) | ![投稿作成](docs/images/new-post.png) |

</div>

---

## 技術スタック

### バックエンド

- **Ruby** 3.4.5
- **Rails** 8.0.2
- **PostgreSQL** 16（本番環境: Supabase）
- **SQLite3**（開発環境）

### フロントエンド

- **Hotwire** (Turbo + Stimulus)
- **Sass** 1.93.2

### 認証

- **Devise** 4.9.4

### ファイルストレージ

- **Active Storage**

### インフラ

- **Render**（アプリケーション）
- **Supabase**（PostgreSQL）
- **GitHub Actions**（CI/CD）（導入予定）

---

## セットアップ

### 必要な環境

- Ruby 3.4.5
- Rails 8.0.2
- Node.js 23.x 以上
- Yarn 1.x 以上
- PostgreSQL 14 以上（本番環境のみ）

### インストール手順

```bash
# 1. リポジトリをクローン
git clone https://github.com/p-pepe/help_hub.git
cd help_hub

# 2. 依存関係をインストール
bundle install
yarn install

# 3. CSSをビルド（初回 or 構成を変えたとき）
bin/rails css:build

# 4. データベースのセットアップ
bin/rails db:setup

# 5. サンプルデータを投入（オプション）
bin/rails db:seed

# 6. 開発サーバーを起動
bin/dev
```

ブラウザで `http://localhost:3000` にアクセス


#### データベース接続エラー
```bash
bin/rails db:reset
```

---

## 使い方

### 基本的な使い方

1. **ユーザー登録**
   - 右上の「新規登録」をクリック
   - メールアドレスとパスワードを入力

2. **投稿を作成**
   - 「投稿する」ボタンをクリック
   - タイトル、本文、タグを入力
   - 「投稿する」ボタンで公開

3. **コメントする**
   - 投稿をクリックして詳細ページへ
   - コメント欄に入力して送信

4. **タグで絞り込み**
   - タグをクリックすると、そのタグの投稿のみ表示

### 開発用コマンド

```bash
# サーバー起動（Turbo & CSS自動ビルド）
bin/dev

# テスト実行
bin/rails test

# システムテスト実行
bin/rails test:system

# RuboCop実行
bin/rubocop

# データベースリセット
bin/rails db:reset

# シードデータ再投入
bin/rails db:seed
```

---

## 開発

### ブランチ戦略

```
main
  └── develop
       ├── feature/機能名
       ├── fix/バグ内容
       └── refactor/対象
```

### ブランチ命名ルール（prefix）

- feat/xxx        : ユーザー向け機能追加
- fix/xxx         : バグ修正
- docs/xxx        : ドキュメント修正・追加
- refactor/xxx    : リファクタリング
- style/xxx       : 見た目やフォーマットのみの変更
- chore/xxx       : ツール・設定・CIなどの雑多変更

### コミットメッセージ規約

```
feat: 新機能追加
fix: バグ修正
refactor: リファクタリング
docs: ドキュメント更新
style: コードスタイル修正
test: テスト追加・修正
chore: ビルドプロセスやツールの変更

例: feat: 投稿にいいね機能を追加 #25
```

### プルリクエスト

1. `develop`ブランチから`feature/*`ブランチを作成
2. 実装・テスト
3. プルリクエストを作成
4. レビュー後、`develop`にマージ
5. 定期的に`develop`を`main`にマージ

---

## テスト

### テスト実行

```bash
# 全テスト実行
bin/rails test

# モデルテストのみ
bin/rails test:models

# コントローラーテストのみ
bin/rails test:controllers

# システムテストのみ
bin/rails test:system

# カバレッジ確認
open coverage/index.html
```

### テストポリシー

- モデルのバリデーション・アソシエーションは必須
- 主要な機能のコントローラーテスト
- ユーザーフローのシステムテスト
- 目標カバレッジ: 80%以上

---

## デプロイ

### Renderへのデプロイ手順

1. **Supabaseでデータベース作成**
   - [Supabase](https://supabase.com/)にサインアップ
   - 新しいプロジェクトを作成
   - 接続情報をコピー

2. **Renderでアプリ作成**
   - [Render](https://render.com/)にサインアップ
   - 「New Web Service」を選択
   - GitHubリポジトリを接続

3. **環境変数の設定**
   ```
   DATABASE_URL: [SupabaseのURL]
   RAILS_MASTER_KEY: [config/master.keyの内容]
   RAILS_ENV: production
   ```

4. **デプロイ**
   - 「Create Web Service」をクリック
   - 自動でデプロイ開始

5. **マイグレーション実行**
   ```bash
   # Renderのコンソールで実行
   bundle exec rails db:migrate
   ```

### 本番環境での確認

```bash
# ログ確認
heroku logs --tail  # Herokuの場合

# コンソール接続
heroku run rails console  # Herokuの場合
```

---
## 今後の予定

### 優先度が高い機能（まず実装したい）

- [ ] キーワード検索機能
- [ ] タグによる複合検索
- [ ] 検索結果ページのUI改善
- [ ] いいね機能
- [ ] いいね数の表示
- [ ] いいねした投稿一覧

### 中期的に追加したい機能

- [ ] ブックマーク機能
- [ ] ブックマーク一覧ページ
- [ ] リアルタイム通知（Action Cable）
- [ ] コメント・いいね通知
- [ ] 通知センター
- [ ] フォロー機能
- [ ] フォロワー一覧
- [ ] フォロー中のユーザーの投稿優先表示

---

## 貢献

このプロジェクトは個人開発ですが、フィードバックやバグ報告は大歓迎です！

### バグ報告

[GitHub Issues](https://github.com/p-pepe/help_hub/issues)からお願いします。

### フィードバック

- 使いやすさの改善提案
- 機能のアイデア
- デザインの改善案

---

## 作者

**p-pepe**

- GitHub: [@p-pepe](https://github.com/p-pepe)

---

## 謝辞

- Rails コミュニティ
- Hotwire コミュニティ
- このプロジェクトに関わってくださった全ての方

---

<div align="center">

**Made by p-pepe**

</div>