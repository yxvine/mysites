---
title: "新的blog开始的第一天"
date: 2019-10-03
categories:
- tranquilpeak
- releases
- hugo
tags:
- hexo start
- responsive
- gravatar
- disqus
- google analytics
keywords:
- disqus
- google
- gravatar
autoThumbnailImage: false
comments: true
thumbnailImagePosition: "top"
thumbnailImage: /images/bgyx1.png
coverImage: /images/bgyx.jpg
metaAlignment: center
summary: 今天准备开始在hugo上新开始自己的blog，折腾的一天，主要涵盖了hugo的安装，以及主题的安装使用，其实选定好主题之后，明确基本的写文章常用的怎么配置就行。
---

<!--more-->

![最终的blog的示例](/images/firstblogs/final.png)
今天准备开始在hugo上新开始自己的blog，折腾的一天，主要涵盖了hugo的安装，以及主题的安装使用，其实选定好主题之后，明确基本的写文章使用markdown文章常用的设置，主要是图片的链接和位置，以及基本的代码高亮等显示，以及最后的关联到github.io的网站。下面是过程的记录
<!-- toc -->


# hugo的安装

## 为什么选择hugo

我之前也用hexo搭建过blogs，之前的体验是安装编译的过程比较慢，hexo是用node.js编写的，而由于我一直对golang念念不忘，虽然目前为止我实际的工作里面从来没有用go进行开发。所以当我看到有人的推荐使用hugo搭建blog而hugo又是go编写的时候，我果断决定折腾一下重新在hugo上搭建一个blog，并要坚持写作下去（之前的blog也荒废了:see_no_evil:）。

## 安装正式过程

参考[hugo的官方文档](https://www.gohugo.org/)。但是自己踩坑了.

1. 安装的时候一定要选择最新版本。由于我的是ubuntu的系统，直接使用apt-get install hugo也可以安装hugo，但是这样安装的hugo的版本是很老的版本，（这导致了我后面下了好几个主题进行配置的时候，编译全部失败）；上面的官方文档[hugo的官方文档](https://www.gohugo.org/) 里面的通过go get的方式安装速度很慢，而且容易go get失败。

2. ubuntu安装hugo最简单的方式是通过在对应的github上下在[release](https://github.com/gohugoio/hugo/releases)的linux的deb进行安装(可以直接双击进行安装)。不过在linux下还用双击的方式，那还不如回去用windows.

```sh

wget/curl -O https://github.com/gohugoio/hugo/releases/download/hugo_0.58.3_Linux-64bit.deb

dpkg -i hugo_0.58.3_Linux-64bit.deb

# 安装成功之后可以新建自己的blog的站点了
# 我希望的站点目录为 ：~/mysites
hugo new site ~/mysites
hugo new about.md #新建md文件，会在content目录下
```

站点的目录结构(带有>表示目录文件)：

```shell
> archetypes  
config.toml  
> content  #存放各种md文件
> data  
> layouts  
> resources  
> static  #存放各种静态资源，主要是图片
> themes #存放各种主题相关的配置文件
```

![目录结构](/images/firstblogs/dir.png)

# hugo主题的选择

其实安装hugo的过程很简单，很大程度上在使用过程中的对于需要怎么配置的使用，完全依赖于选择的主题。所以在选择主题上，在[hugo主题网站上](https://themes.gohugo.io/)自己也是一通搜索，并尝试了几个之后，最后选定了[hugo-tranquilpeak-theme的主题](https://github.com/kakawait/hugo-tranquilpeak-theme)。


主要是该主题的文档说明较为详细，同时，给每篇blog增加缩略图的方式也是我比较喜欢的。不过更多设置方面的配置需要继续使用之后进一步完善。


目前我使用的方式是，将该主题下的example的config.toml基础上进行了 修改，并在content下的md文档也在原来的基础上进行修改。

做一点说明：在写md文件的时候，里面使用到的图片需要放到static目录下（是以static为根目录访问图片的）。

ex：
``` sh
![目录结构](/images/firstblogs/dir.png) 

# 实际的图片路径为 Siteroot/static/images/firstblogs/dir.png
```

选定好主题之后，使用如下命令可以预览当前的blog的渲染情况：

```shell
hugo server -t tranquilpeak -D
```

此时打开:`localhost:1313`；即可预览当前blog网页的情况。同时，hugo支持实时预览，本地修改对应的md文件之后，可以热编译，更新到最新内容。




# github.io的创建

在github的创建repo上创建一个`yourname.github.io`的目录分支。

# 部署到github.io

部署脚本：

```sh
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

```

最后访问https://yxvine.github.io 。
