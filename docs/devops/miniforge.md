---
layout: default
title: Miniforge
parent: DevOps
nav_order: 4
---

# Miniforge


<br>

## Miniforgeとは？

- M1 Macで機械学習用のPython環境構築によく使われるパッケージマネージャ．
- Condaみたいな感じで，複数のConda環境(仮想環境)を作成できる．

<br>

## Miniforgeの導入

[Miniforge](https://github.com/conda-forge/miniforge)をダウンロード
```bash
$ wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-arm64.sh
```

インストール
```bash
$ bash ./Miniforge3-MacOSX-arm64.sh
```

<br>

## 仮想環境

仮想環境についてのイメージ図

<img src="{{ site.url }}/docs/devops/img/conda_example.png">

ベース環境`(base)`の中に`(program01)`，`(program02)`，`(program03)`という環境がある．

- `conda activate 環境名`で書く環境に移動できる．

- `conda info -e`で環境を確認できる．

- `conda deactivate`でConda環境を修了できる．

- `conda create -n program04 python=3.6`で`program04`という名前のPython 3.6の仮想環境を作成できる．

<br>


**仮想環境を導入するメリット**

- PC内で複数のバージョンのPythonを管理できる
- ライブラリも環境ごとに管理できる
- プロジェクトごとに環境を設定することで管理がしやすくなる

<br>

## パッケージ，バージョン管理

- `conda install numpy`で`numpy`をインストールできる．

- `conda search パッケージ名`で正確な名前やバージョンを確認できる．

- `conda list`でインストール済みパッケージを確認できる．

- `conda install python=3.8`でpython自体のインストールもできる．

<br>

## 参考文献

- [conda環境でのpython構築（コマンド、仮想環境等）](https://zenn.dev/coco9122/articles/2c3f57ae367bc4)
- [Conda コマンド](https://www.python.jp/install/anaconda/conda.html)
