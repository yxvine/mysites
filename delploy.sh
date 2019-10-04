#!/bin/bash 

# 删除打包文件夹
rm -rf public


git clone https://github.com/yxvine/yxvine.github.io.git public

# 打包。
hugo -t tranquilpeak # if using a theme, replace with `hugo -t <YOURTHEME>`

# 进入打包文件夹
cd public

# Add changes to git.



# Commit changes.
msg="building site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git add ./
git commit -m "$msg"

#git remote add origin https://github.com/yxvine/yxvine.github.io.git

#git pull  origin master



# 推送到github
# yxvine.github.io 只能使用 master分支

git push -u origin master

cd ..
