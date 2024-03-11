#!/bin/bash

# 安装 Rofi
sudo pacman -S rofi

# 检查是否安装成功
if ! command -v rofi &> /dev/null; then
    echo "安装失败，请手动安装 Rofi。"
    exit 1
fi

# 创建 Rofi 配置目录
config_dir="$HOME/.config/rofi"
mkdir -p "$config_dir"

# 创建 Rofi 配置文件
config_file="$config_dir/config.rasi"

# 检查配置文件是否已存在
if [ -f "$config_file" ]; then
    echo "配置文件已存在。是否要覆盖？(y/n)"
    read -r overwrite_choice
    if [ "$overwrite_choice" != "y" ]; then
        echo "已取消。"
        exit 1
    fi
fi

# 写入配置到配置文件
cat << EOF > "$config_file"
configuration {
    modi: "window,drun,ssh,combi";
    theme: "solarized";
    font: "hack 10";
    combi-modi: "window,drun,ssh";
}
EOF

echo "Rofi 配置已成功设置。"

# 将 Rofi 与 i3 集成
i3_config_file="$HOME/.config/i3/config"

# 检查 i3 配置文件是否存在
if [ -f "$i3_config_file" ]; then
    echo "bindsym \$mod+d exec --no-startup-id rofi -show combi" >> "$i3_config_file"
    echo "已成功将 Rofi 与 i3 集成。"
else
    echo "i3 配置文件不存在，请手动将以下行添加到您的 i3 配置文件中："
    echo "bindsym \$mod+d exec --no-startup-id rofi -show combi"
fi
