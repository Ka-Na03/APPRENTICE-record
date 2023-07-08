# IP アドレスについて説明できる

## 1. IP アドレスとは
IP アドレスとは何か、プログラミング初心者にわかるように説明してください。

**IPアドレスとは**  
インターネットをする時のコンピューター毎に割り当てられた`ネット上の住所`  
IPアドレスという言葉を分解すると  
`I` : インターネット  
`P` : プロトコル  
`アドレス` : 住所  

IP アドレスには「`どのネットワークの、どのコンピューター`」という情報が書かれている  
IPアドレスの役割は、デバイス間の通信を可能にする事です。住所がわからなければどこに送れば良いか分からない様に、ＩＰアドレスが無ければリクエストを送信できません。  

完全に余談だが、昨今ではインターネットを通して悪い事(誹謗中傷や脅迫等)をした人のIPアドレスを法的な手段に則って開示し犯人を特定する事でも役立っていて、住んでいる地域や名前まで割り出される事もあるのでインターネット犯罪の抑止としてもある程度機能しているのかもしれない。


## 2. IP アドレスの種類

IP アドレスにはパブリック（グローバル） IP アドレスとプライベート（ローカル） IP アドレスの2種類があります。それぞれの違いを説明してください。  

1. パブリック（グローバル）IPアドレス
   - 全世界で通用するアドレスで一意なアドレス
   - イメージとしては、ビルやマンション等の建物が建ってある住所で、`部屋番号はローカル`
   - 自分で決める事は出来ず、インターネットプロバイダ(ISP)から割り当てられる
   - ウェブサーバーやメールサーバーなど、直接インターネット上で公開されるサービスやデバイスに使用される
2. プライベート（ローカル）IPアドレス
   - 名前の通りローカルネットワーク内で使用されるアドレス
   - インターネット上では一意ではないので、他のデバイスと重複することがある
   - ルーターやネットワークアドレス変換（NAT）を介してプライベートIPアドレスをパブリックIPアドレスに変換してインターネット通信ができるようになる

**まとめ**
プライベートIPアドレスは、ネットワーク内のデバイスをローカルに識別するために使用され、パブリックIPアドレスはインターネット上でデバイスを一意に特定するために使用されます。ルーターやネットワーク機器を介してプライベートIPアドレスがパブリックIPアドレスに変換されることで、ローカルネットワーク内のデバイスがインターネットと通信できるようになります。

## 3. IP アドレスの割り当て

パブリック IP アドレスは世界共通で割り当てられ使用するため、勝手に好きな番号を使用することはできません。パブリック IP アドレスはどのように割り当てられるのでしょうか。説明してください。  

**インターネットプロバイダ(ISP)から割り当てられる。**
1. ISPとは：
   - インターネットへの接続を提供する会社や組織の事。
   - ユーザーに対してインターネット接続を提供し、IPアドレスを割り当てる
2. ISPの一番の役割：
   - ユーザーにインターネット接続を提供する事で、これによってウェブサイトへのアクセスやメールの送受信、オンラインサービスの利用など、インターネット上で様々な事を行うことができる。
3. 日本国内で代表的なISP：
   - NTTドコモ: 最大手の通信事業者であり、モバイル通信と固定ブロードバンド接続を提供しています。
   - KDDI（auひかり）: auブランドで知られる通信事業者で、auひかりという固定ブロードバンド接続サービスを提供しています。
   - SoftBank（SoftBank光）: SoftBankは携帯電話事業者であり、SoftBank光という固定ブロードバンド接続サービスも提供しています。
4. 世界的に有名なISP：
   - Comcast: アメリカを中心に展開する大手ISPであり、ケーブルテレビとブロードバンドインターネット接続を提供しています。
   - AT&T: アメリカを拠点とする通信企業で、広範なインターネットサービスを提供しています。光ファイバーやDSLなどの接続オプションがあります。
   - Verizon: アメリカを中心に展開する大手通信企業であり、高速インターネット接続を提供しています。光ファイバーサービスの提供も行っています。
   - NTTコミュニケーションズ: 日本を拠点とする通信企業で、日本国内外で広範なインターネットサービスを提供しています。光ファイバー回線が一般的です。
   - Deutsche Telekom: ドイツを拠点とする通信企業で、ヨーロッパで広く知られています。ブロードバンドインターネット接続やモバイルサービスを提供しています。


## 4. IP アドレスのバージョン

IP アドレスには IPv4 と IPv6 があります。それぞれの違いを説明してください。

**IPv4の特徴:**
1. アドレス形式: IPv4は32ビットのアドレス空間を持ち、4つの10進数で表記されます。各セグメントは0から255の範囲の数値です（例: 192.168.0.1）。
2. アドレスの枯渇: IPv4のアドレス空間は約43億個のアドレスを提供できますが、インターネットの急速な普及に伴い、アドレスが枯渇しています。
3. ネットワーク機器の互換性: IPv4は長年にわたり使用されてきたため、ほとんどのネットワーク機器がIPv4に対応しています。

**IPv6の特徴:**
1. アドレス形式: IPv6は128ビットのアドレス空間を持ち、8つの16進数で表記されます。各セグメントは16ビットの数値です（例: 2001:0db8:85a3:0000:0000:8a2e:0370:7334）。
2. アドレスの拡張性: IPv6のアドレス空間は約340無量（3.4×10^38）個のアドレスを提供できます。これにより、アドレスの枯渇問題を解決し、多数のデバイスやネットワークの接続に対応できます。
3. セキュリティとQoSの改善: IPv6はセキュリティや品質サービス（Quality of Service）の強化が組み込まれており、より安全で信頼性の高い通信が可能です。

IPv6は、将来的にはIPv4の置き換えとなることが期待されています。ただし、現在のインターネットインフラストラクチャやネットワーク機器が完全にIPv6に移行するには時間がかかるため、IPv4とIPv6の両方が共存して使用されています。

## 5. IP アドレスの表記

IP アドレスは、IPv4 の場合、192.168.128.10 のように表記します。これは32ビットの正整数値を4組にわけて表記したものです。

192.168.128.10 を32ビットの正整数値で表現してください。

なお、ビットについて知らない場合、ビット及び2進数、10進数について調べてください。

**ビットシフトの分かりやすい計算**

IPv4アドレス「192.168.128.10」を32ビットの正整数値に変換するために、各オクテットの値をビットシフトして加算します。

1. 最初のオクテット (192) の計算：
   192 * 256^3 = 192 * 256 * 256 * 256 = 3,221,225,472

2. 次のオクテット (168) の計算：
   168 * 256^2 = 168 * 256 * 256 = 11,059,712

3. 次のオクテット (128) の計算：
   128 * 256^1 = 128 * 256 = 32,768

4. 最後のオクテット (10) の計算：
   10 * 256^0 = 10 * 1 = 10

以上を合計すると、
3,221,225,472 + 11,059,712 + 32,768 + 10 = 3,232,301,322

したがって、IPv4アドレス「192.168.128.10」は32ビットの正整数値としては 3,232,301,322 になります。

## 6. IP アドレスの CIDR 表記

IP アドレスは、CIDR 表記という方法で表記することができます。10.0.0.0/16 のように表記します。以下を説明してください。

- CIDR 表記とは何か、また何のためにあるものですか？
- 10.0.0.0/16 が表す IP アドレスの範囲は何ですか？

1. CIDR表記はIPアドレスのネットワーク部とホスト部の区別を行い、ネットワークの範囲を表現する為の方法
2. `/24`はIPアドレスの`24ビット`がネットワーク部で残りの`8ビット`がホスト部になる
   - 簡単に言うと10進法で書かれているIPアドレスを2進法にして左から24桁目までがネットワークの情報だよ～って感じになる
   - `/20`なら20ビットで20桁目までだよ～って感じ
3. 何故あるのかについては簡単にいうと従来のアドレスクラスだと必要のないネットワークがもったいないから
4. `10.0.0.0/16`は`10.0`までがネットワーク部で後半の`0.0`がホスト部

## 7. IP アドレスの確認

今自分が使用しているパソコンのパブリック IP アドレス及びプライベート IP アドレスを調べてください。