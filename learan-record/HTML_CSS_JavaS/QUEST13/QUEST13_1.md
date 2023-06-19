# DOM操作ができる
以下、ブログの投稿フォームを作成するための HTML です。この HTML を元に、JavaScript を dom.js に記載し、DOM 操作を行ってください。
```html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ブログ</title>
</head>
<body>
  <h1>ブログ</h1>
  <form id="post-form">
    <label for="title">タイトル：</label><br>
    <input type="text" id="title" name="title"><br>
    <label for="content">本文：</label><br>
    <textarea id="content" name="content"></textarea><br>
    <input type="submit" value="Submit">
  </form>
  <div id="posts"></div>
  <script src="dom.js"></script>
</body>
</html>
```

## 1. DOMとは
- ウェブページの構造を表現するため
- ウェブページの要素の選択や操作
- クリック等のユーザーの操作に応じた反応を組み込める
- APIはソフトウェアとプログラム間でのやり取りや操作を行うためのインターフェース
- DOMとAPIの組み合わせによってウェブページの機能を拡張できる