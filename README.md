#Arch-reminder
本项目是我在使用Archlinux过程中做的一个备忘录。


项目组成：

1. shell脚本 - 记录了我安装和配置的一些步骤（**只适用于我的电脑！不要执行！不要执行！不要执行！否则对你的电脑产生什么后果我不负责** XD）
2. 这个MarkDown文档 - 记录了我遇到的一些问题和解决方法，当然 ArchWiki 上基本上都有，只是总结一下


#使用 Archlinux 遇到的坑

记录一下我遇到的一些问题的解决方法。



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

- 然后在 `~/.xprofile`或者 `~/.xinitrc` (我用zsh也许是`~/.zprofile`)里加入如下语句(这几天输入法频繁失灵，才发现环境变量其实没设置好，我也不清楚到底在哪个文件里写了摔)

  ```shell
   export GTK_IM_MODULE=fcitx
   export QT_IM_MODULE=fcitx
   export XMODIFIERS="@im=fcitx"
  ```

- 重启一下就好了，应该可以正常用fcitx了

- 新学了一招，可以用`fctix-diagnose`来查看自己哪里设置出了问题



##WPS的公式问题（未解决）

- 我目前不知道怎么办，装了deepin提供的字体也没用，谁知道怎么解决请联系我
- 奇怪了在`libreoffice`上是正常显示公式的


##dock上有两个图标问题

- 之前见于chrome，现在已修正，不过我发现[archlinuxcn]源里的sublime-text也有此问题，可用于解决同类问题。
- 解决方案就是desktop文件里改成`StartupWMClass=sublime-text`
- 如果其他应用有同类问题多半也是StartupWMClass写错了



##装deepin桌面进不去

- 首先确认有没有安装`xorg-server` (非常好奇装deepin桌面的时候为什么不依赖xorg

- 如果是`lightdm`进不去，首先看看有没有装`deepin-session-ui`包

- 确认装过后，在`/etc/lightdm/lightdm.conf`的`[Seat:*]`下添加`greeter-session=lightdm-deepin-greeter`

- 重启就能正常使用deepin的登陆器啦


##Chrome的密钥环问题（未解决）

- 安装seahorse `sudo pacman -S seahorse`
- ~~添加一个密钥环，起名叫chrome~~
- ~~重启就好了~~
- 之前的方法莫名其妙不行了，于是我重装了chrome，他自己生成了一个密钥环，把密码改成空就好了
- 还是没有完全解决，更新之后会出问题，不知何故



##minecraft不能运行

- 多半是没有装`xorg-randr`这个包



##fluxgui等python写的gtk没法运行

- 安装`sudo pacman -S python-gobject python2-gobject pygtk python-xdg python2-xdg`
- 我也分不清是这几个包里的哪个了，总之都装上吧233



##（！废弃！）安装infinality字体渲染（！废弃！）

-   AUR里的好像很久没更新了，推荐安装[infinality-bundle]源里的

-   安装方法
    - 首先在`/etc/pacman.conf`里添加

          [infinality-bundle]
            Server = http://bohoomil.com/repo/$arch

    - 然后添加信任

      ```shell
        sudo pacman-key -r 962DDE58
        sudo pacman-key -f 962DDE58
        sudo pacman-key --lsign-key 962DDE58
      ```

-   安装 `sudo pacman -S freetype2-infinality-ultimate fonconfig-infinality-ultimate`

-   注意`/usr/share/doc/freetype2-infinality-ultimate/infinality-settings.sh`要放在`/etc/X11/xinit/xinitrc.d/`才有效

-   关于字体渲染的东西没怎么研究，欢迎指教

-   **infinality作者已弃坑！！！现在直接装freetype差别不大！差别不大！差别不大！**


##安装virtualbox

- 之前配置挺复杂的，现在装几个包就好了，安装`sudo pacman -S virtualbox virtualbox-host-modules-arch virtualbox-ext-oracle`
- 重启之后vbox就能自己加载模块了


## deepin中的QT5主题

- 安装`sudo pacman -S qt5ct`
- 在`/etc/environment` 中添加`QT_QPA_PLATFORMTHEME=qt5ct`
- 重启后就可以打开`qt5ct`进行设置
- （这个方法也许针对其他不是QT的桌面环境也有效，不过我之前不知道有`qt5ct`这个包）


## Android Studio ：设备空间不足

- 这个问题搜中文找不到，搜`No space left on device` 才找到解决办法
- 是因为`/tmp`被默认挂载到了`tmpfs`上，我这里只有2GB，所以AS在下载的时候可能出现空间不够的情况（我才不会说其实是我4G小内存不够用了，tmpfs的大小是内存的一半
- 解决办法（3个）：
  1. 把tmpfs在`/etc/fstab`里写明挂载到硬盘上，这个办法有点矫枉过正了
  2. 启动AS时加一句`Djava.io.tmpdir=/var/tmp`，把临时目录换成别的
  3. 用`ln`命令做个链接，这样就能下载到硬盘上了
- P.S. 解决是可以解决，但是下载速度会变慢...结论：我需要SSD和内存条！


## Android Studio ：Cannot make SDCard.

- 导致无法创建虚拟机。其实缺少两个库
- 解决办法：安装`lib32-gcc-libs`和`lib32-ncurses`


## Android Studio ：启动虚拟机失败

- 原因：自带的lib的原因
- 解决办法：启动时添加`-use-system-libs`参数，或添加环境变量`ANDROID_EMULATOR_USE_SYSTEM_LIBS=1`
- 最终我放弃使用虚拟机了Orz，因为内存实在不够用了


#未完待续......



#忠告
- ~~还是用 mac 吧，别瞎折腾了!~~ 距离写这个文档到现在，虽然得折腾，linux桌面还是进步不小的，我目前的需求基本都能满足，所以我还是选择自由的linux 嘿嘿，受不了折腾的就去用mac吧！
