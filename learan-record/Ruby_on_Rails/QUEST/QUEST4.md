# ActiveRecord を使いこなせる

## 1. ActiveRecord とは
- ActiveRecordは、Ruby on Railsフレームワークの一部であり、オブジェクト関係マッピング（ORM）ライブラリの1つです。ORMは、データベースとオブジェクト指向プログラミングの世界の橋渡しをする役割を果たします。

- ActiveRecordでは、データベーステーブルとそれに関連するデータをオブジェクトとして扱うことができます。つまり、テーブルの行（レコード）はオブジェクトのインスタンスとして表現されます。これにより、データベース操作をオブジェクト指向の手法で行うことができます。

- ActiveRecordを使うメリットは以下のような点です:

  - 簡潔なコード: ActiveRecordは、データベース操作に関連する繰り返しのコードを大幅に減らすことができます。データベースクエリの作成やパラメータのバインド、結果の処理など、面倒な部分を自動化してくれます。

  - モデルの抽象化: ActiveRecordでは、データベーステーブルと対応するモデルを定義します。モデルはビジネスロジックを持つことができ、データベースとの関連付けやバリデーションなどの機能を提供します。これにより、データベースに対してより意味のある操作を行うことができます。

  - データベースの移植性: ActiveRecordは、さまざまな種類のデータベースに対して抽象化されたインターフェースを提供します。これにより、データベースの種類を変更する場合でも、アプリケーションのコードを大幅に変更せずに移行することができます。

- Active Recordパターンは、オブジェクト指向プログラミングにおけるデザインパターンの1つです。このパターンでは、データベースのレコードをオブジェクトとして表現し、それぞれのオブジェクトが自身のデータ操作やビジネスロジックを持つことができます。

- Active Recordパターンの主な目的は、データベースレコードとオブジェクトの間の関連性を維持し、オブジェクト指向の原則に従った操作を可能にすることです。オブジェクトはデータベーステーブルと直接対応し、属性や関連、操作などを持つことができます。これにより、オブジェクト指向プログラミングの柔軟性と再利用性をデータベース操作にも適用することができます。

- ActiveRecordはこのパターンを実装したものであり、データベーステーブルとオブジェクトのマッピングを自動的に行います。このような設計により、データベースとのやり取りを直感的で簡単な方法で行うことができます。

## 2. 全データの取得

## 3. 実行されるＳＱＬクエリの確認

## 4. 特定のデータの取得

## 5. バリデーション