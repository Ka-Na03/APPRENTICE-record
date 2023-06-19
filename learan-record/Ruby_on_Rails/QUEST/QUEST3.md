# CRUD処理を実装できる

TODO を管理できる「TODO アプリ」を作りながら学んでいきましょう。基本的な機能は以下の通りです。
- TODO を追加する: ユーザーは新しいタスクを追加することができます。各タスクにはタイトル（タスクの簡単な説明）があります。
- TODO の一覧を表示する: ユーザーは、すべてのタスクの一覧示することができます。一覧には、タスクのタイトルが表示されます。
- TODO を編集する: タスクのタイトルを編集することができます。
- TODO を削除する: 一覧からタスクを削除することができます。

## 1.プロジェクトの作成

- ターミナルにて`rails new TODO`を実行
- `cd TODO`でディレクトリを移動
- `rails server`で起動

## 2. テーブルの作成
- マイグレーションファイルを作成
  ```shell
  TODO> rails g model Todo title:text
        invoke  active_record
        create    db/migrate/20230610013811_create_todos.rb
        create    app/models/todo.rb
        invoke    test_unit
        create      test/models/todo_test.rb
        create      test/fixtures/todos.yml
  ```
- データベースに先ほど作成した変更を反映
  ``` shell
  \TODO> rails db:migrate
  == 20230610013811 CreateTodos: migrating ======================================
  -- create_table(:todos)
    -> 0.0021s
  == 20230610013811 CreateTodos: migrated (0.0023s) =============================
  ```
  - `rails console`でrailsのirbコンソールを起動しカラムが正しくあるか確認
  ```shell
  irb(main):002:0> Todo.column_names
  => ["id", "title", "created_at", "updated_at"]
  ```

## 3. モデルの作成

- さっきの過程のマイグレートでモデルも作成されている
  ```ruby:app\models\todo.rb
  class Todo < ApplicationRecord
  end
  ```

## 4. ルーティングの設定

- コントローラを作るコマンドでルーティングも一緒に作成される
  ```shell
  TODO> rails g controller home todos
        create  app/controllers/home_controller.rb
        route  get 'home/todos'
        invoke  erb
        create    app/views/home
        create    app/views/home/todos.html.erb
        invoke  test_unit
        create    test/controllers/home_controller_test.rb
        invoke  helper
        create    app/helpers/home_helper.rb
        invoke    test_unit
  ```
- config\routes.rb
  - 2行目以降を追記
    ```rb:config\routes.rb
    Rails.application.routes.draw do
      get 'home/todos'
      get "/" => "home#todos"
      get "todos" => "home#todos"
    end
    ```

## 5. コントローラーの作成

- これも先ほどのコマンドで作成されている

  ```rb:app\controllers\home_controller.rb
  class HomeController < ApplicationController
    def todos
    end
  end
  ```

## 6. ビューの作成
- HTMLのコピペ
  ```erb:html
  <div class="container">
    <h1>Todo List</h1>

    <a class="new-task" href="/todos/new">タスクを追加する</a>

    <table>
      <thead>
        <tr>
          <th>タスク</th>
          <th>アクション</th>
        </tr>
      </thead>
      <tbody>
        <!-- ここは後から動的コンテンツに置き換える -->
        <tr>
          <td>サンプルタスク</td>
          <td>
            <a class="edit" href="#">編集</a>
            <a class="delete" href="#">削除</a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  ```
- cssのコピペ
  ```css:css
  body {
    font-family: "Helvetica Neue", Arial, "Hiragino Kaku Gothic ProN", "Hiragino Sans", Meiryo, sans-serif;
    background-color: #f5f5f5;
    padding: 20px;
  }

  .container {
    max-width: 600px;
    margin: 0 auto;
  }

  h1 {
    text-align: center;
  }

  form {
    display: flex;
    margin-bottom: 20px;
  }

  form input[type="text"] {
    flex: 1;
    padding: 10px;
    margin-right: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
  }

  form input[type="submit"] {
    width: 150px;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    color: #fff;
    background-color: #007BFF;
    cursor: pointer;
  }

  table {
    width: 100%;
    border-collapse: collapse;
  }

  table,
  th,
  td {
    border: 1px solid #ddd;
  }

  th,
  td {
    padding: 10px;
    text-align: left;
  }

  .edit,
  .delete {
    display: inline-block;
    padding: 10px;
    border: none;
    border-radius: 4px;
    color: #fff;
    text-decoration: none;
    margin-right: 5px;
  }

  .edit {
    background-color: #FFC107;
  }

  .delete {
    background-color: #DC3545;
  }

  .new-task {
    display: inline-block;
    margin-bottom: 20px;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    color: #fff;
    background-color: #007BFF;
    text-decoration: none;
  }
  ```

## 7. TODO新規作成ページの作成

- viewsのhomeの下に新規ファイルで`new.html.erb`を作成
  - `app\views\home\new.html.erb`
  - これをコピペ
  ```html
  <div class="container">
    <h1>タスクの追加</h1>

    <form>
      <input type="text" placeholder="タスクを入力する">
      <input type="submit" value="保存する">
    </form>
  </div>
  ```

- `app\controllers\home_controller.rb`にアクションを追加
  ```rb
  class HomeController < ApplicationController
    def todos
    end

    def new
    end
  
  end
  ```

- `config\routes.rb`にルーティングを追加
  ```rb
  Rails.application.routes.draw do
    get 'home/todos'
    get "/" => "home#todos"
    get "todos" => "home#todos"
    get "todos/new" => "home#new"

  end
  ```

- 追加した内容をデータベースに保存する処理を追加
  - `app\controllers\home_controller.rb`のアクションに下記を書く
    ```rb
    def create
      @todo = Todo.new(title: params[:title])
      @todo.save
    end
    ```
  - `変数params`はハッシュで格納されている。
  - コントーローラー内で使用されて、キーと値のペアで構成されたデータでキーを参照してアクセスできる

  - `app\views\home\new.html.erb`を書き換える
    ```erb
    <div class="container">
      <h1>タスクの追加</h1>
      <%= form_tag("/todos/new") do %>
        <form>
          <input type="text" name="title" placeholder="タスクを入力する">
          <input type="submit" value="保存する">
        </form>
      <% end %>
    </div>
    ```
  - ~~上記のコードだと、一見うまくいったかと思いきやDBに保存されていなかった。~~
  - ~~`form_tagメソッド`は`<form>`タグを自動的に生成するので、重複して使用されている事になるのが問題だった、`<form>`タグ削除して~~
  - マジでアホ。`form_tag`の送信先の`URLが/todos/create`にじゃなく`new`になってるだけだった


- タスクを保存したら`/todos`に戻るようにするリダイレクトを設定
  - `app\controllers\home_controller.rb`にリダイレクトを追加する
    ```rb
    def create
      @todo = Todo.new(title: params[:title])
      @todo.save
      redirect_to("/todos")
    end
    ```

## 8. TODO一覧の表示

- `app\views\home\todos.html.erb`を書き換える
  ```erb
  <tbody>
    <!-- ここは後から動的コンテンツに置き換える -->
    <% @todos.each do |todo| %>
    <tr>
      <td><%= link_to(todo.title, "/todos/#{todo.id}") %></td> 
      <td>
        <a class="edit" href="<%= todo.id %>">編集</a>
        <a class="delete" href="#">削除</a>
      </td>
    </tr>
    <% end %>
  </tbody>
  ```

## 9. 編集ページの作成

- まずviewsにファイル`\home\edit.html.erb`を追加する
  ```erb
  <div class="container">
    <h1>タスクの編集</h1>

    <form>
      <input type="text" placeholder="タスクを入力する">
      <input type="submit" value="保存する">
    </form>
  </div>
  ```
- 次にコントローラーに`edit`を追加
  ```rb
  def edit
  end
  ```
- ルートファイルに`get "todos/edit" => "home#edit"`を追加   

**これで編集ページに飛べるようになった**

### 保存処理を書いていく
- まず`<form>`タグを`<%= form_tag>`に変えて無駄に入れ子になっていたのを修正
- `edit.html.erbの`３行目を`<%= form_tag("/todos/#{@todo.id}/update") do %>`
  - `@todo.id`でDBに保存されているidに対応した場所に保存する
- `todos.html.erb`内の編集リンクをIDに対応したリンク先としてつくる
  ```erb
  <% @todos.each do |todo| %>
  <tr>
    <td><%= link_to(todo.title, "/todos/#{todo.id}/edit") %></td> 
    <td>
      <a class="edit" href="/todos/<%= todo.id %>/edit">編集</a>
      <a class="delete" href="#">削除</a>
    </td>
  </tr>
  <% end %>
  ```
  - `todo.id`でIDを指定している
- `app\views\home\edit.html.erb`を書き換える
  - フォームの保存先としてIDと紐づいた`update`を指定
  - `<input>`の`name属性`を指定して編集フォームで入力されたタイトルが取得される
    ```erb
    <div class="container">
      <h1>タスクの編集</h1>
      <%= form_tag("/todos/#{@todo.id}/update") do %>
          <input type="text" name="todo[title]" placeholder="タスクを入力する">
          <input type="submit" value="保存する">
      <% end %>
    </div>
    ```
    - `name="todo[title]"`によって、フォームのフィールドの値が`params`ハッシュ内の`"todo"`キーの値として渡されるようになる
  
- `\home_controller.rb`でページに表示させる部分の`edit`とデータを上書きする為の`update`を作る
  - `edit`にはIDに対応したTODOを指定できる様にする処理
    ```rb
    def edit
      @todo = Todo.find(params[:id])
    end
    ```
  - `update`にはデータを上書き保存し、リダイレクトする処理
    ```rb
    def update
      @todo = Todo.find(params[:id])
      @todo.update(todo_params)
      redirect_to("/todos")
    end
    ```
    - `@todo.update(todo_params)`の引数はメソッドで定義
      ```rb
      private

      def todo_params
        params.require(:todo).permit(:title)
      end
      ```
      - `parms.require`でハッシュからキーである`:todo`に対応する値である`title`を


- `config\routes.rb`に追記
  ```rb
  Rails.application.routes.draw do
    get "todos/new" => "home#new"
    post "todos/create" => "home#create"
    get "todos/:id/edit" => "home#edit"
    post "todos/:id/update" => "home#update"

    get 'home/todos'
    get "/" => "home#todos"
    get "todos" => "home#todos"

  end
  ```
## 10. 削除機能

削除ボタンをクリックすると「**本当に削除していいですか?**」と確認ダイアログが表示され、**OKをクリックするとTODOが削除**され、TODO一覧ページにリダイレクトするようにする

- `app\views\home\todos.html.erb`の削除の`<a>`タグを`button_to`ヘルパーメソッドにする
  - `<%= button_to "削除", "/todos/#{todo.id}/delete", method: :delete, data: { confirm: "削除しますか？" }, class: "delete" %>`
  - 上記のメソッドは通常のHTMLの`<a>`タグとはいくつか異なる点がある、**要確認**
  - このままだとマウスカーソルを乗せたときのアイコンが変わらないので、CSSを少し書き換える
    ```css
    .delete {
      background-color: #DC3545;
      cursor: pointer;
    }
    ```