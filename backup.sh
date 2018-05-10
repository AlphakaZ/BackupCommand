#!/bin/bash

# Settings
backupfolderpath=~/.backup #ベースフォルダ名
VERSION="0.01"

# 変数宣言
foldername=$backupfolderpath #今回バックアップをするフォルダ名

#指定したファイルが存在するか判定する
function checkFileExists(){
  if [$1 -eq ""]; then
    echo "ファイルが指定されていません。終了します。"
    exit 1
  fi
  if [ -e $1 ]; then
    echo "バックアップを作成します。"
  else
    echo "ファイル$1は存在しません。"
    exit 1
  fi
}

#ベースバックアップフォルダ作成
createBackupFolder(){
  if [ -e $backupfolderpath ]; then
    echo "初期バックアップフォルダ：" $backupfolderpath
  else
    mkdir $backupfolderpath
    echo "初期バックアップフォルダを作成しました：" $backupfolderpath
  fi
}

#バックアップフォルダ作成(yyyy-mm-dd_hhmmss)
createNowBackupFolder(){
  yyyymmdd=`date '+%F_%H%M%S'`
  foldername="$backupfolderpath/${yyyymmdd}"
  if [ -e $foldername ]; then
    echo "バックアップフォルダ：" $foldername
  else
    mkdir $foldername
    echo "バックアップフォルダを作成しました：" $foldername
  fi
}
#データのバックアップ $1: ファイル名
backupData(){
  name=$foldername/$1
  cp -r $1 $name
  echo $name にバックアップを作成しました。
}

BACKUPLIST=()

# 指定したファイルについて、どれだけバックアップバージョンがあるかを検索し、表示する
listup(){
  BACKUPLIST=()
}

###処理###

case $1 in
  '-l' )
    echo "指定したファイルのリストを表示します。"
    shift
    exit 0
    ;;
  '-v' )
    echo "Version:$VERSION"
    shift
    exit 0
    ;;
esac
 #引数をずらす

checkFileExists $1
createBackupFolder #ベースフォルダ作成
createNowBackupFolder
backupData $1

