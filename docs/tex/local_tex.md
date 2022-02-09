---
layout: default
title: ローカルでtexを記述する
parent: TeX
nav_order: 1
---

## TeX の導入

[https://prog-masaki.com/install-latex/](https://prog-masaki.com/install-latex/)

上記サイトを参考にしています．

まず．Homebrew で`imagemagick`と`ghostscript`をインストールしてください．

```bash
$ brew install imagemagick
$ brew install ghostscript
```

次に，LaTeX を使うために**Tex Shop**をインストールします．

- 公式サイト[MacTeX -Tex Shop](http://tug.org/mactex/)

このサイトの「MacTeX Download」をクリックして，「MacTex.pkg」ファイルを各自の Macbook にダウンロードしてください．

TeXShop を開き，「環境設定 > 設定プロファイル」で「pTeX(ptex2pdf)」を選択してください．

<br>

## LaTeX サンプル

**LaTeX ファイルの記述**

tex ファイル「main.tex」を作成し，以下を記述してください．

```latex
\documentclass[a5j]{jsarticle}

\begin{document}

  Hello World!

\end{document}

```

**LaTeX ファイルのコンパイル**

作成した tex ファイルを PDF ファイルへコンパイルします．

- コマンドライン上でコンパイルする方法

```bash
$ platex main.tex   # main.tex → main.dvi
$ dvipdfmx main.dvi # main.dvi → main.pdf
```

<br>

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

！コンパイル方法が特殊なので注意！

<br>

Q. 論文の出展とか調べるの面倒なんだけど？

A. Google Scholar を使えば BibTeX の形式の出力が取れます．

<br>

**BiBTeX サンプル**

「ref.bib」ファイルに以下を記述してみましょう．

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

「ref.bib」ファイルの記述した論文情報を元に，LaTeX ファイル(.tex)に参考文献リストを出力することができます．以下の 2 行を参考文献を出力したい箇所に記述すれば OK．

```latex
\bibliography{ref} % ref.bibから拡張子を外した名前
\bibliographystyle{junsrt} % 参考文献の出力スタイル
```

こんな感じ

```latex
\documentclass[a5j]{jsarticle}

\begin{document}

	\section{序論}
  	Hello World!

  \section{実験}

  % ref.bibの情報を元に，参考文献が自動で記述される．
  \bibliography{ref} % ref.bibから拡張子を外した名前
  \bibliographystyle{junsrt} % 参考文献の出力スタイル

\end{document}
```

<br>

**pLaTeX と BiBTeX を同時にコンパイル**

コマンドラインで

1. LaTeX ファイル(main.tex)と BiBTeX ファイル(ref.bib)を同期
2. LaTeX ファイル(main.tex)から PDF ファイル(main.pdf)へコンパイル
3. プレビュー(Mac 標準搭載)で PDF ファイル(main.pdf)を開く

を一括実行するために，シェルスクリプト「compile.sh」を記述してみましょう．

```bash
# tex to dvi
platex main.tex

# attach bib
pbibtex main

# tex to dvi
platex main.tex
platex main.tex
platex main.tex

# dvi to pdf
dvipdfmx main.dvi

# open Preview app
open -a Preview main.pdf
```

実行

```bash
$ bash compile.sh
```

<br>

**サンプルコード**

Github: [https://github.com/imai-laboratory/b4_induction_training/tree/master/docs/tex/sample](https://github.com/imai-laboratory/b4_induction_training/tree/master/docs/tex/sample) に，LaTeX のサンプルコードがあります．

- main.tex：LaTeX で書かれた本文
- compile.sh：main.tex をコンパイルして main.pdf を作成するシェルスクリプト
