---
layout: default
title: Ubuntu環境
parent: NVIDIA GPU
nav_order: 1
---

# Ubuntuマシン



機械学習のためのGPUマシン環境構築



クリーンブートしたUbuntu16.04LTS マシンに，[NVIDIA](http://d.hatena.ne.jp/keyword/NVIDIA) [GPU](http://d.hatena.ne.jp/keyword/GPU)を導入し，CuDA・cuDNNをセットアップする手順を記します．自分の使っているマシンの情報を把握することで，エラー解決に繋がります．

 

例：筆者が使用しているUbuntuマシン，2020/01/10時点

- OS : [Ubuntu](http://d.hatena.ne.jp/keyword/Ubuntu) 16.04.6 LTS ([GNU/Linux](http://d.hatena.ne.jp/keyword/GNU/Linux) 4.4.0-145-generic [x86](http://d.hatena.ne.jp/keyword/x86)_64)
- RAM : 16 GB
- CPU(x8) : [Intel](http://d.hatena.ne.jp/keyword/Intel) [Core i7](http://d.hatena.ne.jp/keyword/Core i7)-6700 CPU @ 3.40GHz
- [GPU](http://d.hatena.ne.jp/keyword/GPU)(x1) : [NVIDIA](http://d.hatena.ne.jp/keyword/NVIDIA) [Geforce GTX](http://d.hatena.ne.jp/keyword/Geforce GTX) 1080
  - [NVIDIA](http://d.hatena.ne.jp/keyword/NVIDIA) CUDA : 10.0.130 (/usr/local/cuda-10.0/)
  - [NVIDIA](http://d.hatena.ne.jp/keyword/NVIDIA) cuDNN : 7.4.2.24 (/usr/lib/[x86](http://d.hatena.ne.jp/keyword/x86)_64-[linux](http://d.hatena.ne.jp/keyword/linux)-[gnu](http://d.hatena.ne.jp/keyword/gnu)/libcudnn.so.7.4.2)
  - Python3 : 3.6.9 (/usr/bin/python3.6)
  - Python2 : 2.7.12 (/usr/bin/[python](http://d.hatena.ne.jp/keyword/python))
    - tensorflow 1.13.1 ($HOME/.local/lib/python3.6/site-packages)
    - tensorflow-[gpu](http://d.hatena.ne.jp/keyword/gpu) 1.13.1 ($HOME/.local/lib/python3.6/site-packages)
    - keras 2.2.4 ($HOME/.local/lib/python3.6/site-packages)
    - pytorch 1.2.0 ($HOME/.local/lib/python3.6/site-packages)



<br>



## オペレーティングシステム（OS）

### OSを確認したい

`uname`コマンドを使う

「OS名,ホスト名,OSリリース,OSバージョン,マシンアーキテクチャ,CPUタイプ,プラットフォーム,OS名」が順に表示される．

```bash
$ uname -a
Linux XXXX 4.4.0-145-generic #171-Ubuntu SMP Tue Mar 26 12:43:40 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```





### Linuxディストリビューションを確認したい

`/etc/issue`ファイルをみる

```bash
$ cat /etc/issue
Ubuntu 16.04.6 LTS \n \l
```



`/etc/lsb-release`をみる

```bash
$ cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04 DISTRIB_CODENAME=xenial 
DISTRIB_DESCRIPTION="Ubuntu 16.04.6 LTS"
```



`/etc/os-release`をみる

```bash
$ cat /etc/os-release
NAME=“Ubuntu”
VERSION=“16.04.6 LTS (Xenial Xerus)” ID=ubuntu ID_LIKE=debian PRETTY_NAME=“Ubuntu 16.04.6 LTS” VERSION_ID=“16.04" HOME_URL=“http://www.ubuntu.com/” 
```







### Linuxカーネルを確認したい

`/proc/version`をみる

```
$ cat /proc/version
Linux version 4.4.0-159-generic (buildd@lgw01-amd64-042) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.10) ) #187-Ubuntu SMP Thu Aug 1 16:28:06 UTC 2019
```





 

## ストレージ（ROM）

ストレージデバイス（HDD, SSD）とファイルシステムまわりについて．

### HDDの状態を確認したい

`df -h`コマンドを使う

```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            7.8G     0  7.8G   0% /dev
tmpfs           1.6G   46M  1.6G   3% /run
/dev/sda1       214G  165G   39G  81% /
tmpfs           7.9G  208K  7.9G   1% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           7.9G     0  7.9G   0% /sys/fs/cgroup
/dev/loop3      384K  384K     0 100% /snap/patchelf/93
/dev/loop1      384K  384K     0 100% /snap/patchelf/87
none            7.9G  2.5M  7.9G   1% /tmp/guest-qyuodw
tmpfs           1.6G   64K  1.6G   1% /run/user/998
/dev/loop4       90M   90M     0 100% /snap/core/8213
/dev/loop0       90M   90M     0 100% /snap/core/8268
tmpfs           1.6G     0  1.6G   0% /run/user/1001
```





### ファイル数を確認したい

`wc`コマンドを使う

カレントディレクトリ直下にあるファイル数を表示する

```bash
$ ls -1 | wc -l
20
```



### ファイルのディスク使用量を確認したい

df -hコマンドを使う

カレントディレクトリ直下にあるファイルおよびディレクトリのディスク使用量とその合計を表示する

```bash
$ du -hsc *
689M	Research
4.0K	build
106M	dataset
4.0K	docker
9.3M	gym
50M	kaggle
2.6M	latent.gif
2.0G	opencv
122G	workspace
4.0K	ダウンロード
4.0K	テンプレート
4.0K	デスクトップ
4.0K	ドキュメント
4.0K	ビデオ
4.0K	ピクチャ
4.0K	ミュージック
4.0K	公開
125G	合計

```





## メモリ（RAM）

### メモリデバイスを確認したい

`/proc/meminfo`をみる

メモリの詳細情報が表示される

```bash
$ cat /proc/meminfo
MemTotal: 16377200 kB
MemFree: 3077848 kB
MemAvailable: 15767804 kB
Buffers: 363052 kB
Cached: 12274992 kB
SwapCached: 66936 kB
Active: 8048088 kB
Inactive: 4689560 kB
Active(anon): 25860 kB
Inactive(anon): 86584 kB
...
HugePages_Total: 0
HugePages_Free: 0
HugePages_Rsvd: 0
HugePages_Surp: 0
Hugepagesize: 2048 kB
DirectMap4k: 1907316 kB
DirectMap2M: 14815232 kB
DirectMap1G: 0 kB
```





### メモリの空き容量を確認したい

`free`コマンドを使う

```bash
$ free
              total        used        free      shared  buff/cache   available
Mem:       16377148     2470228      314496       17140    13592424    13460232
Swap:      16720892      431568    16289324
```



`vmstat`コマンドを使う

```bash
$ vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 1  0 431584 267696 944212 12638044    0    2   389    15    0    0  6  2 91  0  0
```





`top`コマンドを使う

```bash
$ top
top - 15:55:05 up 64 days, 23:12,  5 users,  load average: 1.00, 1.04, 1.07
Tasks: 232 total, 2 running, 230 sleeping, 0 stopped, 0 zombie
%Cpu(s): 9.1 us, 3.5 sy, 0.0 ni, 86.9 id, 0.5 wa, 0.0 hi, 0.0 si, 0.0 st
KiB Mem : 16377148 total,   271964 free,  2527528 used, 13577656 buff/cache
KiB Swap: 16720892 total, 16289228 free,   431664 used. 13403420 avail Mem 
...
```


## CPU

### CPUデバイスを確認したい

`/proc/cpuinfo`をみる

CPUのコアごとに詳細情報が表示される

```bash
$ cat /proc/cpuinfo
processor : 0
vendor_id : GenuineIntel
cpu family : 6
model : 94
model name : Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz
stepping : 3
microcode : 0xc6
cpu MHz : 800.062
cache size : 8192 KB
physical id : 0
siblings : 8
...
processor : 1
vendor_id : GenuineIntel
cpu family : 6
model : 94
model name : Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz
...
```

<br>



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
