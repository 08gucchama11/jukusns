# 塾SNS

## サイト概要
### サイトテーマ
個別指導塾において、講師と生徒との情報共有およびコミュニケーションを図るとともに、生徒同士が交流することのできるSNSサイト。
​
### テーマを選んだ理由
私自身が塾で働いていましたが、個別指導塾の生徒は他の生徒との交流があまりありませんでした。  
また、講師間で、あるいは講師と生徒との間で、講師が生徒に対し、どのように指導し、どのように感じていたかを記録として共有することが困難でした。  
さらに、講師と生徒とのコミュニケーションのレベルにも差が生じているのを多々見かけました。  
そこで、生徒間および生徒と講師のコミュニケーション促進のツールとして、また指導情報の共有のためのツールとしてあったら良いと思い、このテーマにしました。
​
### ターゲットユーザ
- 個別指導塾で生徒を指導する講師
- 個別指導塾に通う生徒
- 生徒・講師情報、お知らせ、SNS投稿を管理する管理者
​
### 主な利用シーン
- 生徒と講師との情報共有およびコミュニケーションを図る時
- 講師間での生徒情報の共有を行う時
- 生徒間でのコミュニケーションを図る時
- 管理者（塾長を想定）が指導内容やSNS投稿を把握する時

### 主な機能
- 生徒・講師・管理者ごとのログイン認証
- ロールごとのダッシュボード表示
- 生徒・講師情報の登録、編集、閲覧
- 指導記録の登録、編集、閲覧
- お知らせの作成・閲覧
- SNS投稿、コメント、プロフィール編集
- 投稿本文・ニックネームの検索
- いいね・フォロー機能
- 管理者によるSNS投稿・コメントの管理
​
## 設計書
- UIフロー図１：https://drive.google.com/file/d/16pvwx4ACb2ukss0CuWWQO2DMvCK9Q7I-/view?usp=sharing
- UIフロー図２：https://drive.google.com/file/d/1vX0mVyNVxyL5M3V2-cKgPYNNsEmfJSqb/view?usp=sharing
- UIフロー図３：https://drive.google.com/file/d/1Yix7DX6McqkhcwqokYQLYOU59tnSATrb/view?usp=sharing
- ER図：https://drive.google.com/file/d/1s60VixiBystRE1Dwi34aBITZLWcSc4Du/view?usp=sharing
- テーブル定義書：https://docs.google.com/spreadsheets/d/1YXRWjqNIfEwNSoW2TfjrqAoJsIkhV2E5HdXANN3LrMs/edit?usp=sharing
​
## 開発環境
- OS：Linux(Ubuntu 24.04)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- CSSフレームワーク：Bootstrap
- データベース：MySQL
- インフラ：AWS（EC2/RDS）
- CI：GitHub Actions
- IDE：Visual Studio Code（VSCode）
​
## データの取り扱い
本アプリでは架空の生徒・講師・投稿データを使用しています。  
実在する個人情報および第三者の著作物は使用していません。