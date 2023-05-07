# シェルスクリプトを書くことができる
## 1. Hello
まず`touch`で新規ファイルを作成して`vi`コマンドでテキストエディタを起動。 　  
`#!/bin/bash`を行頭に記述し、`bash`で開くことを宣言。
```bash
$ touch test.sh
$ vi test.sh

#!/bin/bash
echo Hello!

:wq

$ chmod u+x test.sh
$ ./test.sh
Hello!
```

## 2. 標準入力から値を受け取る
変数`NAME=$name`を作って`read`を使って値を入力する。
```bash
NAME=$name
echo "What's your name?"
read NAME
echo "Welcome, ${NAME}!"
```

## 3. 条件分岐
`calculator.sh`というシェルスクリプトを作る。   
最初は変数の代入が無駄に多かったので復習で最小限に書いた。

```bash
#!/bin/bash

echo "Enter to numbers:"
read NUM1
read NUM2
echo "Choose an arithmetic operation (+, -, *, /):"
read OPERATION

case $OPERATION in
	+)
	RESULT=$((NUM1 + NUM2))
		;;
	-)
	RESULT=$((NUM1 - NUM2))
		;;
	*)
	RESULT$((NUM1 * NUM2))
		;;
	/)
	RESULT$((NUM1 / NUM2))
		;;
	*)
	echo "Invalid input"
	exit 1
		;;
esac
echo "The result:${RESULT}
```

## 4. 繰り返し処理
`for`文を使ってやってみた。
`-eq`という整数値の等しい比較を行う演算子が分からずに時間がかかった。  
`-eq 0`で０と比較することで変数`$i`が偶数かどうかを判定できる様になった。 　
```bash
#!/bin/bash

for i in {1..100}
do
  if [ $(($i % 2)) -eq 0 ]
  then
    echo $i
  fi
done
```