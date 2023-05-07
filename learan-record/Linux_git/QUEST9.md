# パーミッションを操作できる
## 1. ファイルのオーナーとグループ
```bash
$ ls -l | grep 'README*'
-rw-rw-r-- 1 kaito kaito    0 4月 30 05:45 README.md
```
もちろんだけどファイルのオーナーもグループも`kaito`

## 2. ファイルのパーミッション
上記の結果から最初の`rw-`で所有者の権限が`'r' 読み取り〇`、`'w' 変更〇`、`'-' 実行×`  
グループの権限も変わらず`rw-`だった。
一番最初の`'-'`はファイルを指名していて、ディレクトリだと`'d'`

## 3. ファイルのパーミッションの設定
`chmod`コマンドでパーミッションの変更ができる。
```bash
$ chmod 764 README.md
$ ls -l | grep 'README*'
-rwxrw-r-- 1 kaito kaito    0 4月 30 05:45 README.md
```

## 4. ディレクトリのパーミッションの設定
同じく`chmod`コマンド
```bash
$ mkdir permission
$ chmod 755 permission
```

## 5. スーパーユーザー
`sudo`コマンドを使ってスーパーユーザーとして作成
```bash
$ sudo mkdir superuser
$ ls -l | grep 'superuser'
drwxr-xr-x 2 root root 4096 4月 30 06:13 superuser
```
グループも`root`になっていたので後で詳しく調べる。