---
layout: default
title: Bash
parent: DevOps
nav_order: 1
---

# Bash

動作環境：macOS Mojave 10.14.4



![bash_logo](img/bash_logo.png)



## 1. シェルとは？

シェル(Shell)とは，OSの[カーネル](https://ja.wikipedia.org/wiki/カーネル)へのアクセスを可能にするために，[ユーザインタフェース](https://ja.wikipedia.org/wiki/インタフェース_(情報技術))を提供するソフトウェアの総称です．名前は，OSの内部（カーネル）とユーザ（アプリケーション）との間にある外殻であることに由来します．

<br>

#### 1.1 シェルコマンド

macOSでは`/bin`の下に，以下のようなシェルコマンドが標準インストールされています．

```bash
~ $ ls -l /bin | grep sh
-r-xr-xr-x  1 root  wheel   618416  3 21  2019 bash
-rwxr-xr-x  1 root  wheel   375824  3 21  2019 csh
-r-xr-xr-x  1 root  wheel  1278736  3 21  2019 ksh
-r-xr-xr-x  1 root  wheel   618480  3 21  2019 sh
-rwxr-xr-x  1 root  wheel   375824  3 21  2019 tcsh
-rwxr-xr-x  1 root  wheel   610240  3 21  2019 zsh
```

これらはいずれもよく使われている[Unixシェル](https://ja.wikipedia.org/wiki/Unixシェル)です．

- Bourne Shell(sh)
  - [Bourne-Again shell](https://ja.wikipedia.org/wiki/Bash) (bash)
  - KornShell (ksh)
    - [Z Shell](https://ja.wikipedia.org/wiki/Z_Shell) (zsh)
- C Shell(csh)
  - [TENEX C shell](https://ja.wikipedia.org/wiki/Tcsh) (tcsh)



環境変数`$SHELL`には「現在使っているログインシェルの絶対パス」が登録されています．

ログインシェルとは，「コマンドで指定されない場合に使用するシェル」のこと.

```bash
$ echo $SHELL
/bin/bash
~/workspace/ml_bootcamp/docs/devops 
```



ログインシェルを変えたい場合は，`chsh`コマンドを使えばOK．

```bash
$ chsh -s /bin/zsh # ログインシェルを/bin/bashから/bin/zshへ変更
```



シェルコマンドは`cd`や`cat`などの標準コマンドと同様に使えます．

シェル

```bash
$ bash --version
GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin18)
Copyright (C) 2007 Free Software Foundation, Inc.
$ zsh --version
zsh 5.3 (x86_64-apple-darwin18.0)
```

<br>



#### 1.2 シェルスクリプトの実行

複数のLinuxコマンドをシェルスクリプト(.sh)に記述して，シェルコマンドでこのファイルを実行することができる．例として，`test.sh`というファイルを作り，以下のように記述してみましょう．

```sh
#!/bin/sh

echo "Hello, World!"
```



シェルスクリプトの実行方法には2通りあります．

1. シェルコマンドを使う

   ```bash
   $ bash test.sh
   Hello, World!
   ```

2. ファイル自体をコマンドとして使う（ファイルの実行権限を追加）

   ```bash
   $ chmod 755 test.sh
   $ ./test.sh
   Hello, World!
   ```


<br>

<br>



## 2. シェルスクリプトの書き方

基本的に，[初心者向けシェルスクリプトの基本コマンドの紹介(Quitta, 2015,12,12)](https://qiita.com/zayarwinttun/items/0dae4cb66d8f4bd2a337)が非常にわかりやすいです．詳しくはAsk google!してください．

<br>



### コメント

`#`でコメントアウトできます

<br>



### 入出力

`echo`で出力、 `read`で入力です．

`io.sh`というファイルを作り，以下のように記述してみよう．

```bash
#!/bin/sh

read NAME
echo "Hello, $NAME! How are you?"
```

実行すると`read`で入力待ち状態になります．

実行結果

```bash
$ bash io.sh
Michita
Hello, Michita! How are you?
```

<br>



### 変数

- 変数の名前として半角英数字とアンダーバーが使えます．（"a~z"，"A~Z"，"0~9"，"_*"）
- 変数に値を与える時，`=`を前後空白なしで書きます．文字列の場合`"`で囲みます．
- 変数をアクセスする時，変数名の前に`$`を入れます．あるいは変数を`${}`で囲みます．



また，以下の変数は，特別な意味を持ちます．特に引数を表す`$1~9`はよく使うので注意．

| 変数    | 機能                                                     |
| :------ | :------------------------------------------------------- |
| \$0     | スクリプト名                                             |
| \$1~\$9 | 引数．1番目の引数を`$1`，2番目の引数を`$2`でアクセスする |
| \$#     | スクリプトに与えた引数の数                               |
| \$*     | 全部の引数をまとめて1つとして処理                        |
| \$@     | 全部の引数を個別として処理                               |
| \$?     | 直前実行したコマンドの終了値（0は成功、1は失敗）         |
| \$\$    | このシェルスクリプトのプロセスID                         |
| \$!     | 最後に実行したバックグラウンドプロセスID                 |

`* ? [ ' " \ $ ; & ( ) | ~ < > # % = スペース タブ 改行`　はシェルスクリプトの特殊文字です．文字列として使うときは `\` を書いてから使います．

<br>



### 演算子

算術演算子を``expr `数字 算術演算子 数字` ``で計算できます．

| 算術演算子 | 意味 | 例                                                          |
| :--------: | :--: | :---------------------------------------------------------- |
|     +      |  加  | ``echo `expr 10 + 20` `` *=> 30*                              |
|     -      |  減  | ``echo `expr 20 - 10` `` *=> 10*                               |
|     \*     |  乗  | ``echo `expr 11 \* 11` `` *=> 121*                             |
|     /      |  割  | ``echo `expr 10 / 2` `` *=> 5*                                 |
|     %      | 剰余 | ``echo `expr 10 % 4` `` *=> 2*                                 |
|     =      | 指定 | `a=\$b` bの値はaに保存される．                              |
|     ==     |  等  | [ "\$a" == "\$b" ] *$aと$bが同じ値の場合TRUEを返す．*       |
|     !=     | 不等 | [ "\$a" != "\$b" ] *$aと$bが同じ値ではない場合TRUEを返す．* |



<br>
比較演算子で条件式を作ることができます．


| 比較演算子 |   意味    | 例                                                           |
| :--------: | :-------: | :----------------------------------------------------------- |
|    -eq     |   equal   | `[ "$a" -eq "$b" ]` *$aと$bが同じ場合TRUEを返す．*           |
|    -ne     | not equal | `[ "$a" -ne "$b" ]` *$aと$bが違い場合TRUEを返す．*           |
|    -gt     |     >     | `[ "$a" -gt "$b" ]` *$aが $bより大きい場合TRUEを返す．*      |
|    -lt     |     <     | `[ "$a" -lt "$b" ]` *$aが $bより小さい場合TRUEを返す．*      |
|    -ge     |    >=     | `[ "$a" -ge "$b" ]` *$aが $bより大きいか同じ場合TRUEを返す．* |
|    -le     |    <=     | `[ "$a" -le "$b" ]` *$aが $bより小さいか同じ場合TRUEを返す．* |
|     !      |    NOT    | `[ ! "$a" -gt "$b" ]` *$aが $bより大きくない場合TRUEを返す．* |
|     -o     |    OR     | `[ "$a" -gt "$b" -o "$a" -lt "$b" ]` *aがbより大きいか小さい場合TRUEを返す．* |
|     -a     |    AND    | `[ "$a" -gt 3 -a "$a" -lt 10 ]` *aが 3より大きく10より小さい場合TRUEを返す．* |

<br>

<br>



### 条件分岐

<br>

**if文**

if文を使ったシェルスクリプトを描いてみましょう．

- `if`の基本の書き方は `if [条件式] then コマンド fi` です．
- 条件が真の場合 `then` の次のコマンドを実行します．
- 違う場合次々の `elif [ 条件 ]` を確認します．
- 真の条件がない場合 `else` の次のコマンドを実行して終了します．
- `else` がない場合は、そのまま終了します．

```bash
#!/bin/sh

a=10
b=300

if [ "$a" -gt "$b" ] # 条件1
then 
		# 条件1がTrue
    echo "a > b"
elif [ "$a" -eq "$b" ] # 条件2
then
		# 条件1がFalseかつ条件2がTrue
    echo "a = b"
else
		# 条件1がFalseかつ条件2がFalse
    echo "a < b"
fi
```


<br>
**switch文**

- `switch`の基本の書き方は `case 変数 in 条件・値) コマンド ;; esac` です．
- 条件・値が変数と合う場合それの次のコマンドを実行します．

```bash
#!/bin/sh

EDITOR="vim"

case "$EDITOR" in
    "emacs") echo "Bad." 
    ;;
    "vscode") echo "Not bad." 
    ;;
    "vim") echo "Awesome!" 
    ;;
esac
```



<br>

### ループ表現

<br>

**while文**

- `while`の基本の書き方は `while [条件式] do コマンド done` です．
- `while`は，条件が満たされる限りループします．

```bash
#!/bin/sh

a=0
while [ $a -lt 5 ]
do
    echo $a
    a=`expr $a + 1`
done
```

実行結果

```bash
$ ./while.sh
0
1
2
3
4
```

<br>



**until文**

- `until`の基本の書き方は `until [条件式] do コマンド done` です．
- `until`は，条件が満たされるまでループします．

```bash
#!/bin/sh

a=0
until [ ! $a -lt 5 ]
do
    echo $a
    a=`expr $a + 1`
done
```

実行結果

```bash
$ ./until.sh
0
1
2
3
4
```

<br>



**for文**

- `for`の基本の書き方は `for 変数 in 複数値・変数・範囲 do コマンド done` です．


```bash
#!/bin/sh

for var in 0 1 2 3 4
do
    echo $var
done
```

実行結果

```bash
$ ./for.sh
0
1
2
3
4
```

<br>

<br>





## 環境変数

シェルコマンド、およびシェルスクリプトは環境変数を利用できます．`printenv`コマンドで現在定義されている環境変数を一覧表示できます．

```bash
$ printenv
TERM_PROGRAM=Apple_Terminal
SHELL=/bin/bash
TERM=xterm-256color
TMPDIR=/var/folders/g5/zbwwk4dn47xgsc999xby2j8h0000gp/T/
Apple_PubSub_Socket_Render=/private/tmp/com.apple.launchd.bpYdGvp7OP/Render
TERM_PROGRAM_VERSION=421.1.1
TERM_SESSION_ID=5172A6DD-C88E-4072-A585-1CC1D61D3D42
USER=uchiumi
SSH_AUTH_SOCK=/private/tmp/com.apple.launchd.Kr3cIp1TAV/Listeners
...
```



シェル変数はいつまでも入れておくことができません．いま起動しているシェルを終了してしまうと失われてしまいます．そのシェル変数を環境変数にすることで、いつ何度でもシェルを起動するたびに使えます．

 `export` コマンドを使い、シェル変数を環境変数として設定します．

```bash
$ export LAB="imai lab"
$ printenv
...
LAB=imai lab
```

<br>

<br>



## 参考文献

- [初心者向けシェルスクリプトの基本コマンドの紹介](https://qiita.com/zayarwinttun/items/0dae4cb66d8f4bd2a337) - Quitta, 2015.12.12

