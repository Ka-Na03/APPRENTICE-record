#!/bin/bash

PASSWORD_FILE="passwords.txt"

add_password() {
	read -p "サービス名を入力してください：" service
	read -p "ユーザー名を入力してください：" username
	read -p "パスワードを入力してください：" password
	
	echo "$service:$username:$password" >> "$PASSWORD_FILE"
	echo "パスワードの追加は成功しました。"
}

get_password() {
	read -p "サービス名を入力してください：" service
	
	# ファイルに登録されているサービス名のリストを取得
	service_list=$(cut -d ':' -f 1 "$PASSWORD_FILE")
	
	# サービス名のチェック
	if echo "$service_list" | grep -qw "$service"; then
	# サービス名を含む行を持ってくる
		pass_line=$(grep -x "$service:.*" "$PASSWORD_FILE")
	
	# 各種情報を取得する
		service=$(echo "$pass_line" | cut -d ':' -f 1)
		username=$(echo "$pass_line" | cut -d ':' -f 2)
		password=$(echo "$pass_line" | cut -d ':' -f 3)
		
		echo "サービス名：$service"
		echo "ユーザー名：$username"
		echo "パスワード：$password"
	else
		echo "そのサービスは登録されていません。"
	fi
}
	
 # ターミナルにメニューを表示する

echo "パスワードマネージャーへようこそ！"

while true; do
	echo "次の選択肢から選んでください(Add Password/Get Password/Exit):"
	options=("Add Password" "Get Password" "Exit") 
	
	select opt in "${options[@]}"; do
		case $opt in
		"Add Password")
			add_password
			break
			;;
		"Get Password")
			get_password
			break
			;;
		"Exit")
			echo "Thank you!"
			exit 0
			;;
		*)
			echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
			break
			;;
		esac
	done
done
			
