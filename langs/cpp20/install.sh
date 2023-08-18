sudo apt install -y g++-12

#GMP
sudo apt install -y libgmp3-dev

cd /tmp

# ac library
sudo mkdir /opt/ac-library
wget https://github.com/atcoder/ac-library/releases/download/v1.5.1/ac-library.zip -O ac-library.zip
sudo unzip /tmp/ac-library.zip -d /opt/ac-library

# boost
sudo apt install -y build-essential
wget https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.gz -O boost_1_82_0.tar.gz
tar xf boost_1_82_0.tar.gz
cd boost_1_82_0
./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel
./b2 -j3 toolset=gcc variant=release link=static runtime-link=static cxxflags=""-std=c++20"" stage
sudo ./b2 -j3 toolset=gcc variant=release link=static runtime-link=static cxxflags=""-std=c++20"" --prefix=/opt/boost/gcc install


#Eigen
sudo apt install -y libeigen3-dev=3.4.0-2ubuntu2
