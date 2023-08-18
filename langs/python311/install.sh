cd /tmp

# 依存関係のインストール。 参考:https://devguide.python.org/getting-started/setup-building/#build-dependencies
sudo env DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true apt install -y build-essential gdb lcov pkg-config \
      libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
      libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
      lzma lzma-dev tk-dev uuid-dev zlib1g-dev git

# Python 3.11.4をソースからインストール
wget https://www.python.org/ftp/python/3.11.4/Python-3.11.4.tar.xz -O Python-3.11.4.tar.xz
tar xf Python-3.11.4.tar.xz
cd Python-3.11.4

# 追加したいconfigureのオプションがあればご自由にどうぞ
./configure --enable-optimizations
make
# 元から入っているpythonとバッティングしないように/usr/local/bin/python3.11にインストール
sudo make altinstall
cd ..

python3.11 -m pip install \
      numpy==1.24.1 \
      scipy==1.10.1 \
      networkx==3.0 \
      sympy==1.11.1 \
      sortedcontainers==2.4.0  \
      more-itertools==9.0.0 \
      shapely==2.0.0 \
      bitarray==2.6.2 \
      PuLP==2.7.0 \
      mpmath==1.2.1 \
      pandas==1.5.2 \
      z3-solver==4.12.1.0 \
      scikit-learn==1.2.0 \
      ortools==9.5.2237 \
      torch==1.13.1 \
      polars==0.15.15 \
      lightgbm==3.3.1 \
      gmpy2==2.1.5 \
      numba==0.57.0 \
      git+https://github.com/not522/ac-library-python@58f324ec020d57191e7b9e4957b0c5feb5ed3aff 

# setuptoolsを更新しないとcppyyのインストールでエラーが出る場合がある
python3.11 -m pip install -U setuptools==66.0.0
python3.11 -m pip install cppyy==2.4.1

# 開発用
python3.11 -m pip install ipython
