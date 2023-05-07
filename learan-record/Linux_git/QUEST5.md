# ディレクトリを操作
Linux にログインしてターミナル上で行った操作
## 1. 現在のディレクトリ
`pwd`コマンドで現在いる位置を表示できる。
```bash
VirtualBox:~$ pwd
/home/kaito
VirtualBox:~$
```

## 2. ルートディレクトリ
`cd`コマンドでディレクトリの移動ができる。
```bash
VirtualBox:~$ cd /
VirtualBox:/$ pwd
/
VirtualBox:/$
```

## 3. ホームディレクトリ
`cd /home`
```bash
VirtualBox:/$ cd /home
VirtualBox:/home$
```

## 4. 一つ上のディレクトリ
`cd`に`..`オプションをつけて現在いるディレクトリから一つ上のディレクトリに移動できる。
```bash
VirtualBox:/home$ cd ..
VirtualBox:/$
```

## 5. ディレクトリの内容
`ls`コマンドでディレクトリ内のファイルを確認できる。
```bash
VirtualBox:/$ ls
bin cdrom etc lib lib64 losy+found mnt proc run swapfile
# 等々...
```

## 6. 隠しファイル
`ls`に`-a`オプションで隠しファイルを表示することができる。
```bash
VirtualBox:/$ ls -a
bin cdrom etc lib lib64 losy+found mnt proc run swapfile
# 等々...
```

## 7. 詳細なリスト形式
`ls`に`-l`オプションで詳細なリスト形式で表示できる。
もしくは`ll`でも可能
```bash
VirtualBox:/$ cd /etc
VirtualBox:/etc$ ls -l
 合計 1132
drwxr-xr-x  4 root root   4096  4月 27 01:59 ModemManeger
.
.
.
```

## 8. ディレクトリの作成
`mkdir ディレクトリ名`コマンドでディレクトリを作成できる。
Ubuntuの初期設定では`root`ユーザーのパスワードが設定されていないので利用不可。  
管理者として設定したユーザーで`sudo`コマンドを実行した
```bash
VirtualBox:/home$ sudo mkdir porjects
VirtualBox:/home$ ls
kaito projects
VirtualBox:/home$
```

## 9. ディレクトリの削除
`rmdir`コマンドで空のディレクリを削除できる。 　
`rm`コマンドでファイルを削除できる。  
```bash
VirtualBox:/home$ sudo rmdir porjects
VirtualBox:/home$ ls
kaito
VirtualBox:/home$
```