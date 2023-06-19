# Rails API
[RealWorld の バックエンドの API](https://realworld-docs.netlify.app/docs/specs/backend-specs/introduction)  の仕様を満たす Rails API を作成します。   
RealWorld の API の仕様を部分的に満たした API を作成します。具体的には、認証機能のない簡易バージョンの作成になります。

RealWorld のAPIのうち、次のエンドポイントを実装する

- [Create Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#create-article)
- [Get Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#get-article)
- [Update Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#update-article)
- [Delete Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#delete-article)

なお、Article に関わる要素のうち、認証機能及び著者、タグ、お気に入り(`favorite`) は実装しなくてよいものとします。

## 1. プロジェクトのセットアップ

-  `rails`コマンドを使用して新しくRails APIプロジェクトを作成する
   - `--api`オプションをつけてAPI専用の設定で作成する
    ```shell
    $ rails new rails_api --api
    ```
   - `cd`コマンドでプロジェクトのディレクトリに移動する事を忘れないように

## 2. Articleリソースの作成

- `rails generate resource`コマンドを使用して、リソースを作成する。
  ```shell
  $ rails generate resource Article title:string description:string body:text
  ```
  - `Article`という名前を指定しタイトル「`title`」、説明「`description`」、本文「`body`」の属性を指定
  - 上記のコマンドでモデル、マイグレーションファイル、コントローラ、ビューなどの必要なファイルが自動的に生成されます。

## 3. マイグレーションの実行

- `rails db:migrate`コマンドでマイグレーションを実行
  ```shell
  $ rails db:migrate
    == 20230615012116 CreateArticles: migrating ===================================
    -- create_table(:articles)
      -> 0.0015s
    == 20230615012116 CreateArticles: migrated (0.0018s) ==========================
  ```
  - データベースのテーブルやカラムを作成する為の処理
  - STEP2で行った`Article`リソースに対応しているテーブルとカラムが作成された

## 4. ルーティングの設定

- `rails_api`をVScodeで開き、`config\routes.rb`を開く
  - マイグレーションを行った後なので最初は以下の様になっている
  ```rb
  Rails.application.routes.draw do
    resources :articles
    
  end
  ```
- APIのエンドポイントに対するルートを設定する
  - `namespace`メソッドを仕様して、`:api`に続くURLをエンドポイントをグループ化する
  - `resources`メソッドを使用して、アクションを自動生成し、コードを簡潔にする
  - `only`オプションを使用して必要なアクションのみを指定して制限する
    ```rb
    Rails.application.routes.draw do
      namespace :api do
        resources :articles, only: [:create, :show, :update, :destroy]
      end
    end
    ```

## 5. コントローラの作成

- `rails g controller Articles`コマンドでAPI用のArticlesコントローラを作成。
  - そのままコマンドを使うとビューファイルが作成されてしまうので、それをスキップしたい
    - `--sikp-template-engine`オプションを使用してビューファイルの生成を飛ばす
    - 上記のオプションは主に**APIコントローラやバックエンドのみのコントローラを作成する際に使う**
  - また、`Articles`というコントローラを作成するにあたって名前の衝突を避け、コントローラを組織化し、再利用性や拡張性を高める為にコントローラ名の前に`Api::`を付けてモジュールを作る必要がある
    > Apiモジュールは、Railsアプリケーション内のAPI関連のコントローラやヘルパーなどをグループ化するために使用され、APIの機能を共有するための名前空間を提供します。
    ```shell
    rails g controller Api::Articles --skip-template-engine
    ```

## 6. アクションを実装する

- `app\controllers\api\articles_controller.rb`が生成されたのでその中にアクションを追加していく
- 前回の工程で`Apiモジュール`を作成したのでモジュールの中に位置している
```rb app\controllers\api\articles_controller.rb
class Api::ArticlesController < ApplicationController
end
```
アクションを作っていく前に必要なアクションとその機能を並べる
1. `create`アクション:
   - リクエストを受け取ってそこから新しい記事を作成する
2. `show`アクション
   - ID等の特定の記事を取得して表示する
3. `update`アクション
   - ID等の特定の記事を更新する
4. `destroy`アクション
   - ID等の特定の記事を削除する

- - -

### `create`アクションの中から書いていく

1. インスタンス変数`@article`を定義
    - `@article = Article.new(articles_params)`で送信されたデータを使用して新しいオブジェクトを作成する   
     `(articles_params)`の中の処理は後で書く
2. `@article.save`で保存が成功した場合のレスポンスと失敗した場合のレスポンスを書く
    - `render`メソッドを使用してビューファイルを介さずにレスポンスを生成してクライアントに返す
    - `option`は`json`を指定する（JSON形式）
    - `status`は処理に対応したステータスコードを指定する
```rb
def create
 @article = Articles.new(articles_params)
 if @article.save
   render json: @article, status: :created
 else
   render json: @article.errors, status: :unprocessable_entity
 end
end
```

### `show`アクション

1. シンプルに`render`で`@article`オブジェクトである記事をJSON形式でレスポンスとして返してる
```rb
def show
 render json: @article
end
```

### `update`アクション

1. `@article.update(article_params)`で送信されたデータを使用して記事が更新される
2. 更新が成功する場合と失敗する場合でレスポンスを返す
```rb
def update
 if @article.update(article_params)
   render json: @article
 else
   render json: @article.errors, status: :unprocessable_entity
 end
end
```

### `destroy`アクション

1. `@article.destroy`で記事を削除する
2. 記事が削除されると`no_content`を返すようにする
   ```rb
    def destroy
      @article.destroy
      render json: {}, status: :no_content
    end
   ```

### `article_arams`の中身を`private`で書く

1. `params`オブジェクトから`article`というキーを取り出す
   - `params`はRailsの特殊オブジェクトでリクエストのパラメータを保持していて、コントローラ内でリクエストから送信されたデータにアクセスする時に使われる
   - `require`は`params`オブジェクトから特定のキーを要求する
   - `:article`はリクエストボディにあるキーで、`params`オブジェクトから`:article`キーを要求している
2. そのデータ内から`title`、`description`、`body`のキーを持ってくる
   - `permit`メソッドは、指定された属性を許可する。
   - リクエストボディ内の`:article`キーの下にある`:title, :description, :body`の３の属性を許可して他の属性は無視
   ```rb
   def article_params
    params.require(:article).permit(:title, :description, :body)
   end
   ```

- - -

## PostManを使って一旦テストしてみる

「[Create Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#create-article)」の`POST /api/articles`のリクエストボディの例を使った
  ```JSON
  {
    "article": {
      "title": "How to train your dragon",
      "description": "Ever wonder how?",
      "body": "You have to believe",
    }
  }
  ```
- レスポンスが期待通りにいかなかった、というかそもそも「slug」とはなんやという状態だった
  - 「slug」はURLの末尾の部分に任意の文字列で指定できる識別子と認識
- そもそも上記の`「slug」`をどこにも書いていないので無理に決まっている。
  ```JSON
  {
      "id": 1,
      "title": "Hello Worlds",
      "description": "Hello Worlds",
      "body": "You have to believe",
      "created_at": "2023-06-18T12:04:30.762Z",
      "updated_at": "2023-06-18T12:04:30.762Z",
  }

上記の問題は一旦置いといて、`GET`はできるのかテスト   
「[Get Article](https://realworld-docs.netlify.app/docs/specs/backend-specs/endpoints#get-article)」の`GET /api/articles/:slug`の末尾を登録されている`id`にしてみた
```JSON
{
    "id": 1,
    "title": "Hello Worlds",
    "description": "Hello Worlds",
    "body": "You have to believe",
    "created_at": "2023-06-18T12:04:30.762Z",
    "updated_at": "2023-06-18T12:04:30.762Z",
}
```
  - なんかエラーが出る気がしたけどいけた

なんか余裕じゃんと思ったらけど`PUT`と`DELETE`はエラーが出たり消えなかったり編集できなかったりとかなり詰まった   
ここからかなりコードを変えたり色々やったけどその過程をしっかり残せてない。

かゆ...うま...

