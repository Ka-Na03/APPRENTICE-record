# データベース関連の基本的な用語を説明できる

## 1. データベース
データベースとは情報やデータの集合です。  
データベースはデータベース管理システム（DBMS）で制御し、データとDBMSおよび、それらに関連するアプリケーションをまとめてデータベース・システム(データベース)と呼びます。  
データベースは関連するデータを複数のテーブルに分割して保存する事ができるので、複数のファイルでデータを管理することができます。  
**以上の事から、データベースは企業や組織の業務に合わせて活用できて、顧客情報の管理や、在庫管理と注文管理、人事管理や生産管理など、様々な情報やデータを分けつつも包括的に管理できます。**  

## 2. DBMSとは
DBMSとは、データベース管理システムの略称で、データベースを管理する為のソフトウェアです。  
データベースとそのエンド・ユーザーまたはプログラムとの間で機能するインターフェイスです。  
データの格納、取得、更新、検索、削除などの管理を行うことができます。また、DBMSはデータベースの監視と制御ができ、パフォーマンスの監視やバックアップとリカバリ等のさまざまな管理が可能です。  
複数のユーザーが同時にデータベースにアクセスすることができ、複数のアプリケーションから同じデータベースを利用する事ができます。  
代表的なDBMSの種類は以下のようなものがあります。
- 関係型DBMS（RDBMS）： テーブルにデータを保存する方式で、SQL言語を用いてデータを操作することができます。代表的なものとして、Oracle、MySQL、PostgreSQL、MicrosoftSQL Server等です。 
- NoSQL DBMS：スキーマの柔軟性に優れていて、大量の非構造化データを格納することができます。代表的なものは、MongoDB、Cassandra、Couchbase、Amazon DynamoDBです。
- オブジェクト指向DBMS（OODBMS）： オブジェクト指向プログラミングとデータベースの特性を組み合わせたDBMSで、オブジェクト指向言語に似たクエリ言語を用いてデータを操作できます。代表的なものは、Objectivity/DB、Zope Object Database、Versant Object Databaseです。

DBMSの選択は、データの種類や量、アプリケーションの性質、アクセス頻度などによって異なります。

**代表的なDBMSの例として、`Oracle`、`MySQL`、`Microsoft SQL Server`、`MongoDB`、`PostgreSQL`、`Cassandra`、`Redis`、`SQLite`です**

## 3. RDBMSとは
関係型DBMS（RDBMS）（リレーショナルデータベースマネジメントシステム： テーブルにデータを保存する方式で、SQL言語を用いてデータを操作することができます。代表的なものとして、Oracle、MySQL、PostgreSQL、MicrosoftSQL Server等です。   
データは表（テーブル）の形式で保存され、１つの表には複数のレコード（横の行）があり、それぞれのレコードには複数のカラム、もしくはフィールド（縦の列）があります。  
色々な表を関連付けて、データ間の関係性を分かりやすく作ることができます。  
特徴として、以下の様なものがあります。(以下ChatGPT)
- データの整合性が保たれる：RDBMSでは、トランザクションと呼ばれる処理単位において、データの整合性を確保するための仕組みが提供されています。
- SQL言語を用いた柔軟なデータ操作：SQLは、データの検索、挿入、更新、削除などの操作を行うための言語であり、柔軟かつ高度なデータ操作が可能です。
- 大規模データの管理に適している：RDBMSは、多数のユーザーからの同時アクセスや大量のデータの格納、高速な検索にも対応できるよう設計されています。
## 4. SQL
SQL（シークェル、エスキューエル）とはクエリを書くための言語で、データベースに命令（クエリ）を送るための言語です。   
SQLは国際標準化されている最も普及しているデータベース言語なので、SQLの知識があれば利用するデータベースが変わっても操作ができます。

## 5. テーブル
テーブルとは保存されたデータの形式で、表形式になっています。  
横方向の列と縦方向の列で構成されていて、縦方向が`カラム`、横方向が`レコード`といいます。  
複数のテーブルを結合し関係（リレーショナル）させる事で、複雑な情報を分かりやすく管理できるようになり、効率的にデータを管理することができます。  

## 6. カラム
カラムとはテーブルの縦方向の列で、データの種類を表しています。  
カラムごとに、文字列と文字数、数値と桁数の様な属性を決めて進めていきます。

## 7. レコード
レコードとは、テーブルの横方向の列で、データそのものを表しています。  
カラムとレコードが重なるデータのことをフィールドといい、エクセルで言うセルです。

## 7. クエリ
クエリとは、データベースから情報を取り出す為の命令文（言語）の総称です。  
クエリは`SQL`という言語で記述されていて、データベースから必要な情報を正確かつ効率的に得る事ができます。