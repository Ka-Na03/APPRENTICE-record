# ファイルを操作できる
## 1. ファイルの中身を出力
`cat`コマンドでファイルの内容を表示する
```bash
VirtualBox:/etc$ cat hosts
127.0.0.1       localhost
127.0.1.1       kaito-VirtualBox
```

## 2. ファイルの中身をスクロール表示
`less`コマンドでテキストファイルを閲覧する
```bash
VirtualBox:/etc$ less hosts
```

## 3. ファイルの作成
`touch`コマンドでファイルを作成する。
```bash
VirtualBox:~$ touch README.md
VirtualBox:~$ ls
README.md
```

## 4. ファイル名の変更
`mv`コマンドでファイルやディレクトリの移動できるが、ファイル名も変更することができる。
```bash
VirtualBox:~$ mv README.md TMP.md
VirtualBox:~$ ls
TMP.md
```
上記の`mv`コマンドではファイル名やディレクトリ名変更を１つずつしか行うことが出来ない。  
`rename`コマンドで一括変更をができる。

## 5. ファイルのコピー
`cp`コマンドでファイルやディレクトリをコピーする。  
`cp (コピーする元フォルダ名) (コピー先のフォルダ名)`
```bash
VirtualBox:~$ cp TMP.md COPY.md
VirtualBox:~$ ls
COPY.md TMP.md
```

## 6. ファイルの削除
今度は`rm`コマンドで実行してみた。
```bash
VirtualBox:~$ rm TMP.md
VirtualBox:~$ ls
COPY.md
```

## 7. シンボリックリンク
`ln`コマンドでハードリンクを作る事ができる。  
それに`-s`オプションをつける事で、シンボリックリンクを作れる。  
シンボリックリンクを簡単に説明するとショートカットファイルの様なもの
```bash
VirtualBox:~$ tocuh README.md
VirtualBox:~$ ln -s README.md README_SYMBOLIC.md
VirtualBox:~$ ls
COPY.md README.md README_SYMBOLIC.md
VirtualBox:~$ echo abcde > README.md
VirtualBox:~$ cat README.md
abcde
VirtualBox:~$ cat README_SYMBOLIC.md
abcde
```

## 8. ファイルの検索
`find`コマンドでファイルの検索ができる。  
`-name`オプションで検索対象を文字列で指定できる。  
`-exec`オプションをつけるとその後に指定したコマンドを実行できる。  
`find (場所の指定) -name "検索したい文字列*"`
「*(半角アスタリスク)」は文字列の完全一致で検索する場合は不要。
```bash
VirtualBox:~$ find -- -name "README*"
./README_SYMBOLIC.md
./README.md
```

## 9. 検索
`grep`コマンドでファイル内の検索ができる。
基本の検索として
```bash
# 'a`を含む行を表示
$ grep 'a' test.txt
sakana
yama
same
cola
```
今回は`a`から始まる単語なので
`grep '^a' sample.txt`の様に検索したい文字の先頭に「`^`」をつける。
```bash
$ grep '^a' sample.txt
apple
```
