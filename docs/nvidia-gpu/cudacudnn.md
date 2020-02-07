---
layout: default
title: CUDA&cuDNN
parent: NVIDIA GPU
nav_order: 2
---

# CUDAおよびcuDNNの設定



## GPU

### GPUデバイスの確認

`lsws`コマンドを使う

```bash
$ sudo lshw -C display 
  *-display               
       詳細: VGA compatible controller
       製品: GP104 [GeForce GTX 1080]
       ベンダー: NVIDIA Corporation
       物理ID: 0
       バス情報: pci@0000:01:00.0
       バージョン: a1
       幅: 64 bits
       クロック: 33MHz
       性能: pm msi pciexpress vga_controller bus_master cap_list rom
       設定: driver=nvidia latency=0
       リソース: irq:317 メモリー:de000000-deffffff メモリー:c0000000-cfffffff メモリー:d0000000-d1ffffff IOポート:e000(サイズ=128) メモリー:df000000-df07ffff
```



`lspci`コマンドを使う

Linuxに搭載されているPCIバスの情報を表示する．

```bash
$ lspci | grep -i nvidia
01:00.0 VGA compatible controller: NVIDIA Corporation GP104 [GeForce GTX 1080] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GP104 High Definition Audio Controller (rev a1)
```

## NVIDIAドライバとCUDA/cuDNNの導入

### NVIDIAドライバのインストール

 

#### 1.下記リンクから，自分のGPUにあうドライバを検索してダウンロードする．

https://www.nvidia.co.jp/Download/index.aspx?lang=jp

![img](https://lh4.googleusercontent.com/m4MAKmekqihk5pqTUHLojPX6uzAZoaGoj2d9EazHOSlVxNuradgm_lF-7piupC_j1dBf-PffJ2e1SaDxf215GddSYx_XdaUAyUkucebB5SSyN9ZrGUl7qeqFe0aUxnnBqQxYYeK7)

 

たとえば，GPU「[NVIDIA](http://d.hatena.ne.jp/keyword/NVIDIA) [GeForce](http://d.hatena.ne.jp/keyword/GeForce) 1080」に対応したドライバは以下のようになる．

![img](https://lh3.googleusercontent.com/e951y4mwYumub525KR2Um_Cqbb6NxYIpnyThgMyIcClu7nvwHUzF5hGK5l3_4k0lPxf9T9uF33u-0t0cTJeovZFNsjXJkBBzCM1B61i4Kk8_xIBSsTWT0oUexsNDx5_QRFrIDIIj)．

#### 2. 新しく[GPU](http://d.hatena.ne.jp/keyword/GPU)ドライバ（[NVIDIA](http://d.hatena.ne.jp/keyword/NVIDIA)ドライバ）をインストールする前に，既にインストールされている[GPU](http://d.hatena.ne.jp/keyword/GPU)ドライバを確認する．

```bash
# マシンにインストール済みのNVIDIAドライバを一覧表示
$ dpkg -l | grep nvidia
ii  nvidia-418             418.87.01-0ubuntu1   amd64   ...        
ii  nvidia-418-dev         418.87.01-0ubuntu1   amd64   ...
ii  nvidia-modprobe        418.87.01-0ubuntu1   amd64   ...
ii  nvidia-opencl-icd-418  418.87.01-0ubuntu1   amd64   ...
ii  nvidia-prime           0.8.2                amd64   ...     
ii  nvidia-settings        418.87.01-0ubuntu1   amd64   ...    

# apt-getでインストールできるNVIDIAドライバの一覧表示
$ apt-cache search "^nvidia-[0-9]{3}$"
nvidia-331 - Transitional package for nvidia-331
nvidia-346 - Transitional package for nvidia-346
nvidia-340 - NVIDIA binary driver - version 340.107
...
nvidia-440 - NVIDIA binary driver - version 440.33.01
nvidia-304 - NVIDIA legacy binary driver - version 304.137
nvidia-415 - NVIDIA binary driver - version 415.27
nvidia-430 - NVIDIA binary driver - version 430.64

```



aptにNVIDIAドライバを提供しているxorg-edgersレポジトリを追加する．

```bash
$ sudo add-apt-repository ppa:xorg-edgers/ppa -y
$ sudo apt-get update
```



aptでNVIDIAドライバ「nvidia-396」をインストールして，マシンを再起動．

```bash
# aptコマンドでドライバnvidia-396をインストール
$ sudo apt-get install -y nvidia-396
# マシンを再起動
$ sudo reboot
```

<br>



### CUDAのインストール

（注意）CUDA・cuDNN・tensorFlow-gpuのバージョンを合わせる必要がある．

#### 1. CUDAの公式ドキュメントをよく読む．

- CUDA Toolkit Documentation https://docs.nvidia.com/cuda/index.html

#### 2. 下記リンクから，NVIDIAドライバに対応するCUDAのバージョンを確認する

- CUDA Toolkit Documentation > Release Notes > 1. CUDA Toolkit Major Components > CUDA Driver https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html

![img](https://lh3.googleusercontent.com/s8gpeKo-VZlCtUROQc6YG1L3ZQ9aJlggnswp_mAAxRFua_Sh0ILtYsa-K4uUYWrjbfgz21EIVJwSrt-StpbGhvpPrxUytW-Xjy146HAo7pmo-SyPT6cP5-YPSFWRHHASmR9xyFon)

#### 3. 下記リンクから，tensorflow-[gpu](http://d.hatena.ne.jp/keyword/gpu)に対応するcuDNN/CUDAのバージョンを確認する

- TensorFlow (Linux) - テスト済みのビルド設定

https://www.tensorflow.org/install/source#linux

![img](https://lh6.googleusercontent.com/LrKW-yUDWLZi5-iq1oz0BB_3dpt3hin3yLEyo8V1QtJzV958tWDaYr5RDwJsOniMxotiNqZsCcYa4-kqs3SdSLd7xzD9ABON4b2MT9kIHPbbnL3lP9GcgZpFRTWjVThXPuQMQNUP)

CUDA・cuDNN・tensorFlow-gpuのバージョン確認を終えた．

今回は，以下で環境構築をする．

- [Python](http://d.hatena.ne.jp/keyword/Python) 3.6.9
- tensorflow-[gpu](http://d.hatena.ne.jp/keyword/gpu) 1.13.1
- CUDA 10.0
- cuDNN 7.4

#### 4. 下記リンクから，自分の環境にあった「CUDA Toolkitパッケージ」を確認し，マシンへダウンロードする．

- CUDA Toolkit Archive https://developer.nvidia.com/cuda-toolkit-archive

![img](https://lh6.googleusercontent.com/6Wg51qcEzuCZ326X81F_48j0pU20MC4qKa0CU847Vw612vZQNUP302zFYWCJ9CA5uKABt6UU7UTLj8M6Kr9ndYKNzT-amTFv3hiWGDakR5gpjFlA3lppzcU-dORL0ojBI6qs-Pv5)

今回は，CUDA10.0で，マシンの環境として，以下を選択．

- Operating System: Linux
- Architecture: x86_64
- Distribution: Ubuntu
- Version: 16.04
- Installer Type: deb [network]

![img](https://lh6.googleusercontent.com/qkrUa2T8IaJ7IflSrZ6XCyDvHqmoP868EnpDlqOoSoYiMcse_8xteV7gEUsmAS_2GCr7GWUI_rClrw7E6i3RuKUKghWm-L5fT8vST6r9CnCHBtxwIS5LvB18ZfMY1Aet173jSWzC)

 

（注意）https://developer.nvidia.com/cuda-downloadsは，最新バージョンのダウンロードリンクなので，ここから安易にCUDAをダウンロードしてはいけない．特に，tensorflow-[gpu](http://d.hatena.ne.jp/keyword/gpu)は，最新のCUDA Toolkitに対応していないので注意する．CUDAとTensorflow-[gpu](http://d.hatena.ne.jp/keyword/gpu)のバージョンがあっていないと，たとえばImportError: libcublas.so.10.0が発生する．

対応するCUDA Toolkit（CUDA 10.0）の.[deb](http://d.hatena.ne.jp/keyword/deb)ファイル(network)は「cuda-repo-ubuntu1604_10.0.130-1_[amd64](http://d.hatena.ne.jp/keyword/amd64).[deb](http://d.hatena.ne.jp/keyword/deb)」となる． この.[deb](http://d.hatena.ne.jp/keyword/deb)ファイルをwgetコマンドを使って，マシンへダウンロードする．

```bash
# wgetコマンドでCUDA Toolkitのパッケージファイルをダウンロード
$ wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
...
`cuda-repo-ubuntu1604_10.0.130-1_amd64.deb’ に保存中
cuda-repo-ubuntu1604_10.0.130-1_amd64.deb      100%[==========================>]  2.77K --.-KB/s  時間 0s   

2019-05-11 16:54:30 (308 MB/s) - `cuda-repo-ubuntu1604_10.0.130-1_amd64.deb’ へ保存完了 [2840/2840]
```

```bash
# .debファイル（CUDA Toolkitのパッケージファイル）を確認
$ ls | grep cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
```



<br>

#### 5. ダウンロードしたCUDA Toolkitパッケージ(.deb)を，マシンへインストールする

dpkgコマンドでCUDA Toolkitパッケージ(.deb)をcudaパッケージとして保存します．さらに，aptコマンドでcudaパッケージをインストールします． 注意：公式に書かれているsudo apt-get install cudaを実行すると自動的に最新版のCUDAがインストールされる．

```bash
# CUDA Toolkit（CUDA 10.0）をマシンにインストールする
$ sudo dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
$ sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
$ sudo apt-get update
$ sudo apt-get install cuda-10-0
```



これでCUDA Toolkit（CUDA 10.0）のインストールは完了．

次に，[環境変数](http://d.hatena.ne.jp/keyword/%B4%C4%B6%AD%CA%D1%BF%F4)（PATH）を設定する．



### cuDNNのインストール



### PATHチェック