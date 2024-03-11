#!/bin/bash

# 编辑 mirrorlist 文件以添加清华、阿里和中科大的镜像源
sudo tee -a /etc/pacman.d/mirrorlist > /dev/null <<EOF
# 清华源
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
# 阿里源
Server = http://mirrors.aliyun.com/archlinux/\$repo/os/\$arch
# 中科大源
Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
EOF


# 更新 pacman 数据库并升级系统
sudo pacman -Syyu
