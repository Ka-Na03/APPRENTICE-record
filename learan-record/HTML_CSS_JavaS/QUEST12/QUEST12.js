// オブジェクトを使うことができる

// 1.書籍プリンター

function printBooks(books) {
  for (let i = 0; i < books.length; i++) {
    const book = books[i];
    console.log(`『${book.title}』${book.writer}`);
  }
};

const books = [
  {title: "はらぺこあおむし", writer: "おれ"},
  {title: "ぐりとぐら", writer: "あいつ"}
];

printBooks(books);

// 2.ユーザーパーミッションチェッカー

function checkPermission(username, permission) {
  for (let i = 0; i < users.length; i++) {
    const user = users[i];
    if (user.username === username) {
      switch (permission) {
        case "canRead":
          return user.permissions.canRead === true;
        case "canWrite":
          return user.permissions.canWrite === true;
        case "canDelete":
          return user.permissions.canDelete === true;
        default:
          return false;
      }
    }
  }
};
let users = [
  {
    username: '山田',
    permissions: {
      canRead: true,
      canWrite: true,
      canDelete: false
    }
  },
  {
    username: '佐藤',
    permissions: {
      canRead: false,
      canWrite: true,
      canDelete: false
    }
  },
  {
    username: '二階堂',
    permissions: {
      canRead: true,
      canWrite: false,
      canDelete: true
    }
  }
];

console.log(checkPermission('山田', 'canRead'));

console.log(checkPermission('山田', 'canDelete'));

console.log(checkPermission('佐藤', 'canRead'));

console.log(checkPermission('二階堂', 'canWrite'));

console.log(checkPermission('佐藤', 'canWrite'));

// 3. メソッド

// 正しいのは１～３

// 1
const obj1 = {
  method: function() {
    console.log('method');
  },
}
// methodというプロパティにキーをコロンで示して、値としてfunctionで関数を宣言

obj1.method();

// 2
const obj2 = {
  method: () => {
    console.log('method');
  },
}
// アロー関数形式で１と同じことをしているだけ

obj2.method();

// 3
const obj3 = {
  method() {
    console.log('method');
  },
}

obj3.method();

// ショートハンド記法とやらを使用して定義されている、functionを省略している
// 一般的なメソッドの定義としては３番目の形式が推奨されているらしい