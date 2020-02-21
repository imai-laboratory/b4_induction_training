---
layout: default
title: TeX
nav_order: 2
has_children: false
permalink: /docs/tex
---

# TeX

TeXの紹介．文書をつくるやつ．「texファイルを記述→コンパイル→pdfができる」 という流れ．とりあえずやってみよう
<br>


## TeXとは？

**TeX**（テフ、テック）は[Donald E. Knuth](https://en.wikipedia.org/wiki/Donald_Knuth) 氏により開発されているオープンソースの[組版](https://ja.wikipedia.org/wiki/組版)処理システムです．TeXベースのプロジェクトとして[Leslie Lamport](https://ja.wikipedia.org/wiki/レスリー・ランポート)氏によって開発された**LaTeX**や，[日本語](https://ja.wikipedia.org/wiki/日本語)用の機能を追加した [TEX](https://ja.wikipedia.org/wiki/TeX) の一種である**pTeX** (Publishing TeX) ，**pLaTeX**(Publishing LaTeX)があります

TeXは，標準的な論文執筆ツールとして世界中で使われており，さまざまな文章作成に用いることができます．今回は，Macに**pLaTeX**の環境を構築する手順を紹介します．

<br>



## TeXの導入

[https://prog-masaki.com/install-latex/](https://prog-masaki.com/install-latex/)

上記サイトを参考にしています．



まず．Homebrewで`imagemagick`と`ghostscript`をインストールしてください．

```bash
$ brew install imagemagick
$ brew install ghostscript
```



次に，LaTeXを使うために**Tex Shop**をインストールします．

- 公式サイト[MacTeX -Tex Shop](http://tug.org/mactex/)



このサイトの「MacTeX Download」をクリックして，「MacTex.pkg」ファイルを各自のMacbookにダウンロードしてください．



TeXShopを開き，「環境設定 > 設定プロファイル」で「pTeX(ptex2pdf)」を選択してください．



<br>



## LaTeXサンプル



**LaTeXファイルの記述**

texファイル「main.tex」を作成し，以下を記述してください．

```latex
\documentclass[a5j]{jsarticle}

\begin{document}

  Hello World!

\end{document}

```



**LaTeXファイルのコンパイル**



作成したtexファイルをPDFファイルへコンパイルします．

- コマンドライン上でコンパイルする方法

 ```bash
$ platex main.tex   # main.tex → main.dvi
$ dvipdfmx main.dvi # main.dvi → main.pdf
 ```

<br>



## LaTeXの文法など



- 基本

  - LaTeXコマンド集

    [http://www.latex-cmd.com/](http://www.latex-cmd.com/)

  - 画像の出力

    [https://texwiki.texjp.org/?LaTeX入門%2F図表](https://texwiki.texjp.org/?LaTeX入門%2F図表)

  - 表の出力

    [http://www.latex-cmd.com/fig_tab/table01.html](http://www.latex-cmd.com/fig_tab/table01.html)

  - 章立て

    [https://medemanabu.net/latex/part-section-subsection/](https://medemanabu.net/latex/part-section-subsection/)





## BibTeX



BibTexとは？

参考文献を簡単に管理するやつ

texファイルとは別にbibファイルを作ってそこに参考文献を記述



詳細はURLを参照

- [BiBTeXとは - Quitta記事, 2019.01.24](https://qiita.com/SUZUKI_Masaya/items/14f9727845e020f8e7e9)

！コンパイル方法が特殊なので注意！

<br>

Q. 論文の出展とか調べるの面倒なんだけど？

A. Google Scholarを使えばBibTeXの形式の出力が取れます．



<br>



**BiBTeXサンプル**

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



「ref.bib」ファイルの記述した論文情報を元に，LaTeXファイル(.tex)に参考文献リストを出力することができます．以下の2行を参考文献を出力したい箇所に記述すればOK．

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



**pLaTeXとBiBTeXを同時にコンパイル**



コマンドラインで

1. LaTeXファイル(main.tex)とBiBTeXファイル(ref.bib)を同期
2. LaTeXファイル(main.tex)からPDFファイル(main.pdf)へコンパイル
3. プレビュー(Mac標準搭載)でPDFファイル(main.pdf)を開く

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

Github: [https://github.com/imai-laboratory/b4_induction_training/tree/master/docs/tex/sample](https://github.com/imai-laboratory/b4_induction_training/tree/master/docs/tex/sample) に，LaTeXのサンプルコードがあります．

- main.tex：LaTeXで書かれた本文
- compile.sh：main.texをコンパイルしてmain.pdfを作成するシェルスクリプト