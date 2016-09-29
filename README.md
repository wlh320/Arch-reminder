#Arch-reminder
本项目是我在使用Archlinux过程中做的一个备忘录
项目组成：

1. shell脚本-记录了我安装和配置的一些步骤（**只适用于我的电脑！不要执行！不要执行！不要执行！否则对你的电脑产生什么后果我不负责** XD）

2. 这个MarkDown文档- 记录了我遇到的一些问题和解决方法，当然 ArchWiki 上基本上都有，只是总结一下

3. TODO
  - [ ] 抽空在虚拟机测试一下脚本
  - [ ] 将脚本改写成适合其他人的（太难了）

#使用 Archlinux 遇到的坑
##安装时连接宽带
- 使用`pppoe-setup`设置账号密码

- 使用`pppoe-start`连接

- ping一下g.cn试试看看网络连接没

##intel/nvidia 双显卡
- 首先安装需要的包
`sudo pacman -S bumblebee mesa xf86-video-intel bbswitch nvidia`
  我这里不装`bbswitch`是用不了bumblebee的，ArchWiki没有说

- 将用户加入bumblebee组
`gpasswd -a user bumblebee`

- 启动bumblebeed服务
`systemctl enable bumblebeed.service`

- 重启，运行`optirun glxspheres64` 如果正常说明配置好啦
或者看一下`screenfetch`的输出，没有GPU那一栏说明已经关独显了

##fcitx输入法
- 我装的是搜狗输入法，首先安装
`sudo pacman -S fcitx-im fcitx-sogoupinyin`
搜狗拼音在[archlinuxcn]的源里有

- 然后在 `~/.xprofile`里加入如下语句

        export GTK_IM_MODULE=fcitx
        export QT_IM_MODULE=fcitx
        export XMODIFIERS="@im=xim"
        export XIM=fcitx
        export XIM_PROGRAM=fcitx

- 重启一下就好了，应该可以正常用fcitx了

##WPS的公式问题（未解决）
- 我目前不知道怎么办，装了deepin提供的字体也没用，谁知道怎么解决请联系我


##dock上有两个图标问题
- 之前见于chrome，现在已修正，不过我发现[archlinuxcn]源里的sublime-text也有此问题，可用于解决同类问题。

- 解决方案就是desktop文件里改成`StartupWMClass=sublime-text`

- 如果其他应用有同类问题多半也是StartupWMClass写错了

##装deepin桌面进不去
- 首先确认有没有安装`xorg-server` (非常好奇装deepin桌面的时候为什么不依赖xorg

- 如果是`lightdm`进不去，首先看看有没有装`deepin-session-ui`包

- 确认装过后，在`/etc/lightdm/lightdm.conf`的`[Seat:*]`下添加`greeter-session=lightdm-deepin-greeter`

- 重启就能正常使用deepin的登陆器啦


##Chrome的密钥环问题
- 安装seahorse `sudo pacman -S seahorse`

- 添加一个密钥环，起名叫chrome

- 重启就好了

##minecraft不能运行
- 多半是没有装`xorg-randr`这个包

##fluxgui等python写的gtk没法运行
- 安装`sudo pacman -S python-gobject python2-gobject pygtk`

##安装infinality字体渲染
- AUR里的好像很久没更新了，推荐安装[infinality-bundle]源里的

- 安装方法
    - 首先在`/etc/pacman.conf`里添加

    	    [infinality-bundle]
            Server = http://bohoomil.com/repo/$arch

    - 然后添加信任

            sudo pacman-key -r 962DDE58
            sudo pacman-key -f 962DDE58
            sudo pacman-key --lsign-key 962DDE58

- 安装 `sudo pacman -S freetype2-infinality-ultimate fonconfig-infinality-ultimate`

- 注意`/usr/share/doc/freetype2-infinality-ultimate/infinality-settings.sh`要放在`/etc/X11/xinit/xinitrc.d/`才有效

- 关于字体渲染的东西没怎么研究，欢迎指教

##安装virtualbox
- 之前配置挺复杂的，现在装几个包就好了，安装`sudo pacman -S virtualbox virtualbox-host-modules-arch virtualbox-ext-oracle`
- 重启之后vbox就能自己加载模块了

#未完待续......

##忠告
- 还是用 mac 吧，别瞎折腾了!

