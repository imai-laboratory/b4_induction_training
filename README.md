# b4_induction_training

今井研のB4向け新人研修のためのドキュメントページです．

### Update log

- 2020/02/03 - サイト作成
- 2020/02/11 - ホスティング開始
- 2020/03/31 - 2020年度の新人研修終了

### For developers

とりあえず，uchiumi([@yumaloop](https://github.com/yumaloop))に連絡してください．

**TL;DR**

- このサイトは，Rubyベースの静的サイトジェネレータ[Jekyll](https://jekyllrb.com/)を使ってビルドされている.
- デザインテーマは[just-the-docs](https://github.com/pmarsceill/just-the-docs)を使っている．
- サーバは[GitHub Pages](https://pages.github.com/)というGithub公式の無料サービスを使っている．

**環境**

- ruby # スクリプト言語
- bundle # gemの管理ツール
- jekyll # gem (静的サイトジェネレータ)

※ `gem`: rubyのライブラリの総称．

**編集作業の流れ**

0. ローカルへレポジトリをコピーする．

```
$ git clone https://github.com/imai-laboratory/b4_induction_training.git
```

1. `docs`ディレクトリ以下の内容を変更する．本文はMarkdownファイル．必要な場合，画像やPDFを追加する．

```
docs
├── devops
│   ├── bash.md
│   ├── devops.md
│   ├── dockder.md
│   ├── git.md
│   └── img
├── dl
│   ├── dl.md
│   ├── dl_fromscratch.md
│   ├── dl_fromscratch.pdf
│   ├── mnist.md
│   └── mnist_notebook.html
├── jekyll
├── ml
│   ├── 1.introductiion.md
│   ├── 2.linear_regression.md
│   ├── ...
│   └── img
├── nlp
│   ├── dl_fromscratch2_nlp.md
│   ├── dl_fromscratch2_nlp.pdf
│   └── nlp.md
├── nvidia-gpu
│   ├── cudacudnn.md
│   ├── nvidia-gpu.md
│   └── ubuntu.md
├── python
│   ├── python.md
│   ├── python_exercise.md
│   └── python_tutorial.md
├── rl
│   ├── references.md
│   └── rl.md
├── stat
│   ├── 1.probability.md
│   ├── 2.variable_and_expectation.md
│   ├── ...
│   └── img
└── tex
    ├── sample
    └── tex.md

```

2. localhostでサーバを立てて確認．

```bash
$ bundle exec jekyll serve
Configuration file: path/to/b4_induction_training/_config.yml
            Source: path/to/b4_induction_training
       Destination: path/to/b4_induction_training/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
       Jekyll Feed: Generating feed for posts
                    done in 6.245 seconds.
 Auto-regeneration: enabled for '/path/to/b4_induction_training'
    Server address: http://127.0.0.1:4000/
  Server running... press ctrl-c to stop.
```

3. `git push`してリモートリポジトリへ変更を反映.

### Links

- Site<br>
https://www.ailab.ics.keio.ac.jp/b4_induction_training/
- Github (source)<br>
https://github.com/imai-laboratory/b4_induction_training 
