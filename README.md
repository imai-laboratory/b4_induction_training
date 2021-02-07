# b4_induction_training

今井研のB4向け新人研修のためのドキュメントページです．

### Update log

- 2020/02/03 - サイト作成
- 2020/02/11 - ホスティング開始
- 2020/03/31 - 2020年度の新人研修終了

### For developers

とりあえず，uchiumi([@yumaloop](https://github.com/yumaloop))に連絡してください．


**編集作業の流れ**

0. ローカルへレポジトリをコピーする．

```
$ git clone https://github.com/imai-laboratory/b4_induction_training.git
```

1. `docs`ディレクトリ以下の内容を変更．

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
│   ├── 3.logistic_regression.md
│   ├── bc_LogisticRegression.html
│   ├── bc_LogisticRegression.ipynb
│   ├── boston_LinearRegression.html
│   ├── boston_LinearRegression.ipynb
│   ├── function_img_asset.ipynb
│   ├── img
│   ├── iris_LogisticRegression.ipynb
│   ├── ml.md
│   ├── titanic_data_science_solutions_jp.html
│   ├── titanic_data_science_solutions_jp.ipynb
│   └── titanic_dss.md
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
│   ├── 3.prob_distribution.md
│   ├── 4.sample_theory.md
│   ├── 5.statistical_inference.md
│   ├── 6.statistical_test.md
│   ├── ans_practice.md
│   ├── ans_practice.pdf
│   ├── img
│   ├── stat.md
│   ├── statistics_guide_tour.md
│   └── statistics_guide_tour.pdf
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
