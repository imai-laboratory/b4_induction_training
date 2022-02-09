---
layout: default
title: overleafでtexを記述する
parent: TeX
nav_order: 2
---

## Overleaf とは

Overleaf とは LaTeX 専用のオンラインエディタです．

環境構築不要で使用でき，便利な機能を沢山備えています．
また，オンラインでリアルタイムに共有・編集・コメントができるので，研究室内でもよく使用されています．
今回は Overleaf に登録し，日本語のファイルを作成・コンパイルし，参考文献を追加するところまで一緒にやってみましょう．

## Overleaf の登録

まず最初に，overleaf のサイトに遷移してください．

[Overleaf, Online LaTeX Editor](https://www.overleaf.com)

サイトに飛んだら，右上の Register を押し，会員登録をしましょう．ailab のメールアドレスで登録するのをお勧めします．

登録できたら，右上の Log In ボタンからログインします．

## 新しいプロジェクトの作成

New Project → Blank Project → ProjectName を入力で新しいプロジェクトが作成されます．

<img src="https://gyazo.com/35bd2ea0eea24fd2ea524da7ebaf4671.png" width="30%">

プロジェクト画面は以下のようになります．

画面の説明

- 画面左
  - ファイルが一覧で表示されます，おそらく tex ファイルを分割したり画像を追加したりでファイルが増えると思うので整理しましょう
- 画面中央
  - 画面左で緑になっているファイルの中身が表示されます．ここで文章を編集しましょう．
- 画面右
  - main.tex をコンパイルした際の出力ファイルが表示されます．

<img src="https://gyazo.com/e50a8b39e538d372d3a3aa60554912d0.png" width = "80%">

## コンパイル

コンパイルは画面右上の Recompile ボタンで実行されます．Recompile ボタン付近にある Download ボタンを押すとコンパイルした PDF をダウンロードできます．

## 日本語に対応できる用に設定する

試しに，`\begin{introduction}`の下に何か書いてコンパイルしてみましょう．
すると，英語では入力できるものの，日本語を入力するとエラーになると思います．

<img src="https://gyazo.com/efb4d4c15a465ff36da53896d8d44cc1.png">

バツがついている部分がエラーです．

日本語を使用したい場合はいくつか設定が必要です．

まず，コンパイラの設定を変更しましょう．左上の menu ボタンを押し，setting のコンパイラを LaTeX に変更してください．

次に latexmkrc というファイルを作ります．画面左上にある New File ボタンを押し`latexmkrc`という名前でファイルを作成してください．

ファイルの中には以下を記述してください．

```latex
$latex = 'platex';
$bibtex = 'pbibtex';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex -U %O -o %D %S';
$pdf_mode = 3;
```

あとはソースファイルをコンパイルすれば日本語が表示されます！

参考
[Overleaf を使った日本語論文の作成](https://qiita.com/fujino-fpu/items/d92d185da730e25743cb)

## LaTeX の文法など

- 基本

  - LaTeX コマンド集

    [http://www.latex-cmd.com/](http://www.latex-cmd.com/)

  - 画像の出力

    [https://texwiki.texjp.org/?LaTeX 入門%2F 図表](https://texwiki.texjp.org/?LaTeX入門%2F図表)

  - 表の出力

    [http://www.latex-cmd.com/fig_tab/table01.html](http://www.latex-cmd.com/fig_tab/table01.html)

  - 章立て

    [https://medemanabu.net/latex/part-section-subsection/](https://medemanabu.net/latex/part-section-subsection/)

## BibTeX

BibTex とは？

参考文献を簡単に管理するやつ

tex ファイルとは別に bib ファイルを作ってそこに参考文献を記述

詳細は URL を参照

- [BiBTeX とは - Quitta 記事, 2019.01.24](https://qiita.com/SUZUKI_Masaya/items/14f9727845e020f8e7e9)

<br>

Q. 論文の出展とか調べるの面倒なんだけど？

A. Google Scholar を使えば BibTeX の形式の出力が取れます．

<br>

**BiBTeX サンプル**

「ref.bib」を作成し，ファイルに以下を記述してみましょう．

```
@article{imai2003physical,
  title={Physical relation and expression: Joint attention for human-robot interaction},
  author={Imai, Michita and Ono, Tetsuo and Ishiguro, Hiroshi},
  journal={IEEE Transactions on Industrial Electronics}, volume={50},
  number={4},
  pages={636--643},
  year={2003},
  publisher={IEEE}
}
```

「ref.bib」ファイルの記述した論文情報を元に，LaTeX ファイル(.tex)に参考文献リストを出力することができます．以下の 2 行を参考文献を出力したい箇所に記述すれば OK．基本的には`\end{document}`の上，文章の最後に記述してください．

```latex
\bibliography{ref} % ref.bibから拡張子を外した名前
\bibliographystyle{junsrt} % 参考文献の出力スタイル
```

こんな感じ

```latex
\documentclass{article}
\usepackage[utf8]{inputenc}

\title{test2022}
\author{authorname }
\date{February 2022}

\begin{document}

\maketitle

\section{Introduction}
今井先生はロボットの研究をしている．

\bibliography{ref} % ref.bibから拡張子を外した名前
\bibliographystyle{junsrt} % 参考文献の出力スタイル

\end{document}
```

<br>

論文を引用したいときは，`\cite{}`の{}内に引用したい論文の略称を記入してください．略称は各文献の一番最初に書かれています．

```latex
\documentclass{article}
\usepackage[utf8]{inputenc}

\title{test2022}
\author{authorname }
\date{February 2022}

\begin{document}

\maketitle

\section{Introduction}
今井先生はロボットの研究をしている\cite{imai2003physical}．

\bibliography{ref} % ref.bibから拡張子を外した名前
\bibliographystyle{junsrt} % 参考文献の出力スタイル

\end{document}
```

リコンパイルすると，cite のところに[]で引用番号が書かれ，reference に文献が追加されていることがわかります．
