#!/bin/bash
<< COMMENTOUT
*= webdrivers使用における環境構築 =*
~/.webdrivers/chromedriver/を生成するため
COMMENTOUT

# GoogleChromeのリポジトリを追加
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
# リポジトリ利用のため公開鍵を追加登録
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
# パッケージを最新にしてchromeをインストール
sudo apt-get update && sudo apt-get install -y google-chrome-stable