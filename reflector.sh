#!/bin/bash

# 使用 reflector 命令进行镜像源更新
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# 用 vim /etc/pacman.conf 命令打开 pacman.conf 文件
