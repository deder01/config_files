YCM_DIR=~/.vim/bundle/YouCompleteMe/
YCM_ENV_DIR=~/.local/ycm

ENVIMPROV_ROOT=/apollo/env/envImprovement/

CLANG_BUILD=3.9.x.6.0
CLANG_VER=3.9.0

CMAKE_BUILD=3.5.x.0.6

STDCPP_BUILD=gcc.2401.1780

GCC_BUILD=4.9.x.3408.298
GCC_VER=4.9.3

YCM_ENV_DIR=$(readlink -f $YCM_ENV_DIR)
YCM_DIR=$(readlink -f $YCM_DIR)

mkdir -p $YCM_ENV_DIR

PYTHON_HOME=$ENVIMPROV_ROOT/python2.7/
PYTHON_LIBRARY=$ENVIMPROV_ROOT/python2.7/lib/libpython2.7.so.1.0
PYTHON_INCLUDE=$ENVIMPROV_ROOT/python2.7/include/python2.7/
PYTHON_EXECUTABLE=$ENVIMPROV_ROOT/bin/python2.7

CMAKE_DIR=$YCM_ENV_DIR/cmake/$CMAKE_BUILD
CLANG_DIR=$YCM_ENV_DIR/clang/$CLANG_BUILD
STDCPP_DIR=$YCM_ENV_DIR/libstdcpp/$STDCPP_BUILD
GCC_DIR=$YCM_ENV_DIR/gcc/$GCC_BUILD

#we use s3proxy for source of packages
#one can list by prefix like this: kcurl "http://devtools-s3proxy-pdx.amazon.com/s3proxy/list?prefix=CMake-2.8"

export CC=clang
export CXX=clang++
#export CC=gcc
#export CXX=g++
mkdir -p $YCM_ENV_DIR

S3_PROXY="http://devtools-s3proxy-pdx.amazon.com/s3proxy/get?s3key="

if [ ! -d "$CMAKE_DIR" ]; then
    mkdir -p $CMAKE_DIR
    for d in "bin" "local" "share"; do
        kcurl "${S3_PROXY}CMake-$CMAKE_BUILD-AL2012-DEV.STD.PTHREAD-$d.tgz" | tar xz -C $CMAKE_DIR
    done
fi
export PATH="$CMAKE_DIR/bin/:$PATH"

if [ ! -d "$STDCPP_DIR" ]; then
    mkdir  -p $STDCPP_DIR
    for d in "lib"; do
        kcurl "${S3_PROXY}LibStdCpp-$STDCPP_BUILD-AL2012-DEV.STD.PTHREAD-$d.tgz" | tar xz -C $STDCPP_DIR
    done
    #$FETCH_PACKAGE --package LibStdCpp --version $STDCPP_BUILD --flavor DEV.STD.PTHREAD --platform RHEL5_64 --dir $STDCPP_DIR
fi

if [ ! -d "$GCC_DIR" ]; then
    mkdir -p $GCC_DIR
    for d in "bin" "gcc-$GCC_VER"; do
        kcurl "${S3_PROXY}GCC-$GCC_BUILD-AL2012-DEV.STD.PTHREAD-$d.tgz" | tar xz -C $GCC_DIR
    done
    #$FETCH_PACKAGE --package GCC --version $GCC_BUILD --flavor DEV.STD.PTHREAD --platform RHEL5_64 --dir $GCC_DIR
fi
export PATH="$GCC_DIR/gcc-$GCC_VER/bin/:$PATH"

if [ ! -d "$CLANG_DIR" ]; then
    mkdir -p $CLANG_DIR
    for d in "bin" "include" "lib" "libexec" "share"; do
        kcurl "${S3_PROXY}LLVM_Clang-$CLANG_BUILD-AL2012-DEV.STD.PTHREAD-$d.tgz" | tar xz -C $CLANG_DIR
    done
    #$FETCH_PACKAGE --package LLVM_Clang --version $CLANG_BUILD --flavor DEV.STD.PTHREAD --platform AL2012 --dir $CLANG_DIR
    #wget "http://devtools-s3proxy-pdx.amazon.com/s3proxy/get?s3key=LLVM_Clang-$CLANG_BUILD-AL2012-DEV.STD.PTHREAD-include.tgz" -O $CLANG_DIR/includes.tgz
    #tar xzpf $CLANG_DIR/includes.tgz -C $CLANG_DIR
    ln -s $CLANG_DIR/lib/clang/$CLANG_VER/include $CLANG_DIR/
fi
export PATH="$CLANG_DIR/bin/:$PATH"

PATH_TO_LLVM_ROOT=$CLANG_DIR
export PATH_TO_LLVM_ROOT

export LD_LIBRARY_PATH=$STDCPP_DIR/lib

cd $YCM_DIR
cp $YCM_DIR/third_party/ycmd/cpp/CMakeLists.txt $YCM_ENV_DIR
cp $YCM_DIR/third_party/ycmd/cpp/ycm/CMakeLists.txt $YCM_ENV_DIR/CMakeLists.txt2
cp $YCM_DIR/third_party/ycmd/build.py $YCM_ENV_DIR/

echo "set(PYTHON_LIBRARY $PYTHON_LIBRARY)" > $YCM_DIR/third_party/ycmd/cpp/CMakeLists.txt
echo "set(PYTHON_INCLUDE_DIR $PYTHON_INCLUDE)" >> $YCM_DIR/third_party/ycmd/cpp/CMakeLists.txt
echo "set(PYTHON_EXECUTABLE $PYTHON_EXECUTABLE)" >> $YCM_DIR/third_party/ycmd/cpp/CMakeLists.txt
cat $YCM_ENV_DIR/CMakeLists.txt >> $YCM_DIR/third_party/ycmd/cpp/CMakeLists.txt

#set( PATH_TO_LLVM_ROOT "" CACHE PATH "Path to the root of a LLVM+Clang binary distribution" )
#set( EXTERNAL_LIBCLANG_PATH "" CACHE PATH "Path to the libclang library to use" )
#sed -i "s|^GCC_LDPATH=.*$|GCC_LDPATH=$STDCPP_DIR/lib|" $CLANG_DIR/bin/clang
sed -i "s|^set[ \(]*PATH_TO_LLVM_ROOT\ .*$|set(PATH_TO_LLVM_ROOT $CLANG_DIR)|" $YCM_DIR/third_party/ycmd/cpp/ycm/CMakeLists.txt
#sed -i "s|^GCC_LDPATH=.*$|GCC_LDPATH=$STDCPP_DIR/lib|" $CLANG_DIR/bin/clang

echo "set(EXTERNAL_LIBCLANG_PATH $CLANG_DIR/lib/libclang.so)" >> $YCM_DIR/third_party/ycmd/cpp/CMakeLists.txt
echo "set(PATH_TO_LLVM_ROOT $CLANG_DIR)" >> $YCM_DIR/third_party/ycmd/cpp/CMakeLists.txt

sed -i "s|^.*ull_cmake_args.extend.*CustomPythonCmakeArgs.*$||" $YCM_DIR/third_party/ycmd/build.py

$ENVIMPROV_ROOT/bin/python2.7 install.py --clang-completer --system-libclang --java-completer

cp $YCM_ENV_DIR/CMakeLists.txt  $YCM_DIR/third_party/ycmd/cpp/CMakeLists.txt
cp $YCM_ENV_DIR/CMakeLists.txt2 $YCM_DIR/third_party/ycmd/cpp/ycm/CMakeLists.txt
cp $YCM_ENV_DIR/build.py  $YCM_DIR/third_party/ycmd/

echo "Save the following as something like /usr/local/bin/python-ycm, chmod +x it"
echo "=======================Cut here==================="
cat <<EOF
#!/bin/bash
export LD_LIBRARY_PATH=$STDCPP_DIR/lib:$CLANG_DIR/lib/:$ENVIMPROV_ROOT/lib
$ENVIMPROV_ROOT/bin/python "\$@"
EOF
echo "=======================Cut here==================="
echo "And put the following line in your ~/.vimrc"
echo "let g:ycm_path_to_python_interpreter = '/usr/local/bin/python-ycm'"
