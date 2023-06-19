// 2. 要素ノードの変更

let elements = document.getElementsByTagName('h1');
elements[0].textContent = 'シンプルブログ';

// 3. イベントハンドラの設定

const form = document.getElementById('post-form');

form.addEventListener('submit', function(event) {
  event.preventDefault();

  const titleInput = document.getElementById('title');
  const contentInput = document.getElementById('content');
  const title = titleInput.value;
  const content = contentInput.value;

  console.log('タイトル：', title);
  console.log('本文：', content);
  form.reset();
});