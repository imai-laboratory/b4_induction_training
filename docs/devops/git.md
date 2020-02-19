---
layout: default
title: Git
parent: DevOps
nav_order: 2
---

# Git



## 導入



**Gitのインストール**

macOSには標準でgitがインストールされています．

```bash
$ which git
/usr/bin/git
$ $ git --version
git version 2.17.1 (Apple Git-112)
```

不具合があれば，下記サイトを参考にgitをインストールしてください．

[https://tracpath.com/bootcamp/git-install-to-mac.html](https://tracpath.com/bootcamp/git-install-to-mac.html)



**Githubアカウントの作成**

```bash
$ git config --global user.email "you@example.com"
$ git config --global user.name "Your Name"
```





## 使い方



```bash
$ git init # 初期化
$ git add . # 変更の追加
$ git commit -m "edit foo.html" # 変更をコミット
$ git push origin master # 変更をプッシュ
```







## 参考文献

- [サルでもわかるGit入門](https://backlog.com/ja/git-tutorial/?gclid=EAIaIQobChMIxYKOsYK_5wIVD6yWCh3p9gPaEAAYASAAEgIxpfD_BwE)

