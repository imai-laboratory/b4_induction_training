---
layout: default
title: 演習問題の解答
parent: 確率・統計
nav_order: 20
---

# 演習問題の解答

### 1. 確率

疾患の有無を$$B={0,1}$$，陽性/陰性反応を$$A={0,1}$$として，ベイスの定理を適用．解答は$$1/3$$．

<br>

### 2. 

(a) $$E[X^k] = \int_0^{\infty} x^k e^{-x} dx = k!$$

(b) 確率分布関数$$F_Y(y)$$について，

$$
F_Y(y) = P(Y \leq y) = P(\sigma X + \mu \leq y) = P(X \leq \frac{y - \mu}{\sigma}) = F_X(\frac{y - \mu}{\sigma})
$$

だから，

$$
f_Y(y) = \frac{d F_Y(y)}{dy} = \frac{d F_X(\frac{y - \mu}{\sigma})}{dx} \cdot \frac{dx}{dy} = f_X(\frac{y - \mu}{\sigma}) \cdot \frac{1} {\sigma}
$$

となる．よって，$$f_Y(y) = \frac{1}{\sigma} \exp \left( - \frac{x - \mu}{\sigma} \right)$$

<br>

### 3. 

なし

<br>

### 4. 

$$
\begin{align}
\bar{X} 
&= \frac{1}{n} \sum_{i=1}^{n} X_i \\
E[\bar{X}] 
&= E\left[ \frac{1}{n} \sum_{i=1}^{n} X_i \right] \\
&= \frac{1}{n} \sum_{i=1}^{n} E[ X_i ] \\
&= \frac{1}{n} \sum_{i=1}^{n} \mu \\
&= \mu \\
V[\bar{X}]
&= V\left[ \frac{1}{n} \sum_{i=1}^{n} X_i \right] \\
&= \frac{1}{n^2} \sum_{i=1}^{n} V[ X_i ] \\
&= \frac{1}{n^2} \sum_{i=1}^{n} \sigma^2 \\
&= \frac{\sigma^2}{n}
\end{align}
$$



<br>

### 5. 

$$\sigma^2$$の対数尤度関数は，
$$
\begin{align}
\ell (\sigma^2 | X) 
&= \log \prod_{i=1}^{n} p(X_i) \\
&= \log \prod_{i=1}^{n} \frac{1}{\sqrt{2 \pi \sigma^2}} \exp \left( -\frac{X_i^2}{2 \sigma^2} \right) \\
&= \log {(2 \pi \sigma^2)}^{- \frac{n}{2}} \exp \left( - \frac{\sum_{i=1}^{n} X_i^2}{2 \sigma^2} \right) \\
&= - \frac{n}{2} \log 2 \pi \sigma^2 - \frac{\sum_{i=1}^{n} X_i^2}{2 \sigma^2}
\end{align}
$$
だから，これを$$\sigma^2$$に対して微分すると，


$$
\frac{\partial \ell (\sigma^2 | X) }{\partial \sigma^2}
= -\frac{n}{2 \sigma^2} + \frac{\sum_{i=1}^{n} X_i^2}{2 \sigma^4}
$$


よって，$$\frac{\partial \ell (\sigma^2 | X) }{\partial \sigma^2} = 0$$を解けば，$$\sigma^2$$の最尤推定量は，$$\frac{\sum_{i=1}^{n} X_i^2}{n}$$ となる．

<br>

### 6. 

- 帰無仮説: W社の製造するワイン瓶の平均内容量は750mlである．
- 対立仮説: W社の製造するワイン瓶の平均内容量は750mlより少ない．
- 検定方式: 標本平均・標本不変分散を求めて，片側t検定を行う．
