Q:rtp帧格式
A:
version:rtp协议版本，目前版本为2，2bit
p(panding):包末尾是否含有padding bytes，机密算法可能会用到
x(extension):标识是否有头部扩展，可以用于存储信息，比如视频旋转角度
CC(csrc count):csrc的数量，且最多只能有15个csrc
M(marker):程序自己定义的行为
PT(payload type):payload的数据类型，音视频的默认映射格式参见rfc3551
sequence number:递增序列号
timestamp：时间戳，接收方根据其来回放音视频，时间戳的间隔由传输的数据结构类型确定
ssrc:同步源标识符，相同rtp会话中ssrc是唯一的，需要保持随机
csrc:mcu混流时使用，标识混流出的新的音视频流的ssrc是由哪些源ssrc贡献的，最多混15路音视频流
extension header:头部扩展

Q:DTMF信号(Dual Tone Multi-Frequency)双音多频
A:
当用户在电话键盘上按下数字键或符号键时，电话系统会产生两个不同频率的声音信号，这两个频率的信号叠加在一起，形成一个独特的双音多频信号，然后通过电话线路传输给接收方。接收方的电话系统会识别这个双音多频信号，然后执行相应的操作，比如拨打电话、查询语音信箱等。
简单的讲，就是按下数字键或者符号键的信号，这个技术就是用来识别电话键盘上数字、符号和字母等按键信息的技术。

Q:NetEq是网络延迟估计器
A:
NetEq技术的主要作用是抵消网络延迟和波动对音频传输造成的影响，使音频数据在接收端能够按照正确的顺序和时间播放出来。NetEq技术通过自适应抖动缓冲的方式，可以动态地调整音频数据的延迟和抖动，以适应网络状况的变化。
提供一定的抗抖动，抗丢包能力

Q:某一个音频协议的编码码率
A:
音频编码码率可以简单计算得出：码率=采样率(khz) * 采样位深(16bit) * 通道数量
码率越高，代表着携带的信息越多，同时消耗的网络带宽也越多，码率越低，代表压缩率可能比较高，携带的有效信息可能较少，可能会造成音视频卡顿，失真等现象，但是再弱网情况下，有时不得不降低输出码率来适应网络需求。

Q:source /opt/rh/devtoolset-8/enable
A:
这个是在linux上编译代码时首先需要运行加载的资源，它包含了一组更新的编译器、调试器和其他开发工具，用于编译和构建C/C++等程序

Q:服务器传输到另一台服务器上
A:
scp filename root@10.4.11.161:
然后输入密码

Q:Linux返回上一次操作目录
A:cd -


Q:为什么会出现-c++17支持不了的情况
A:
source /opt/rh/devtoolset-8/enable

Q:直接克隆指定远程分支
A:
git clone -b branch_name --recursive http://git

Q:shell中的:=什么意思
A:
变量为空或者没有经过赋值，则对其进行赋值，否则就不进行赋值

Q:shell中的?=什么意思
A:
变量没定义，则定义并赋值

Q:coredump文件存放路径
A:
cat /proc/sys/kernel/core_pattern
ls /opt/apollo/log/other/coredump/

Q:远程docker
A:
Dev Containers 插件

tips：centos上data命令可以查看当前时间
tips：gdb可以使用where查看调用栈

Q:git 查看track情况
A:
git branch -vv

Q:git 更新子模块
A:
git submodule update --remote <submodule-name>

Q:g++ -w不生成任何警告信息
A:


Q:音频格式
A:
wav,mp3,pcm

Q:
A:

PTS和DTS是音视频开发中的两个关键概念，它们分别代表着Presentation Time Stamp（显示时间戳）和Decode Time Stamp（解码时间戳）。

Q:
A:


Q:
A:

tips：async表示异步，sync表示同步

tips：3840 * 2160 4k分辨率

deinit析构器

ITranscoderSdkInterface 里面有创建转码器的接口，接口类型为ITranscoderInterface
ITranscoderInterface
TranscoderParam	解码参数，在解码开始时(start函数)会传入
TranscoderChannelParam 解码通道参数，在解码开始时(start函数)会将多个通道打包成vector传入
接口如下：
```virtual TRANSCODER_STATUS Start(const TranscoderParam& param, const std::vector<TranscoderChannelParam>& channelParams, ITranscoderEventCallback* eventCallback) = 0;
```
ComTimerWrapperSink定时器发生器接口，只有一个ontimer的接口
ITranscoderEventCallback 转码事件回调接口，里面有一堆相当于槽函数的东西

Transcoder继承了转码接口和通道参数接口ITranscoderInterface，IChannelParamGether
将所有的通道的信息存入，然后根据通道查找对应参数IChannelParamGether
affinity 密切关系
Resolution分辨率




10.4.12.162/root/Admin123@pl这个环境 国产化gpu平台



硬件库ma-hw -> umpl -> 转码->sdk



umpl模块:
IUmplEncodedDataSink数据编码输出，只有一个可重写的OnDataEncoded
IUmplEncoder：编码器

i420感觉就是yuv420p，yyyyuuvv
yv12 yyyyvvuu
nv12 yyyyuuvv
nv21 yyyyvvuu

1、拉取support_arm分支代码到Linux上，编译得到so文件
2、将这个so文件替换到vendors/umpl/lib/arm64-linux下的so文件
3、更改ma-hw amd64 release2.0.5
4、


已经替换了硬件库
然后替换arm64的umpl.so动态库
替换umpl接口


1、下载更新ma-hw release2.0.5，替换vendors/ma-hw
2、在10.4.12.162的docker-gcc中编译umpl的support_arm分支代码，将生成的.so文件替换到vendors/umpl/lib/arm64-linux下
3、更换umpl/interface/下的umpl文件夹和umpl.h接口
4、在10.4.12.162上make出现链接错误


如何控制走硬件转码还是走软件
我更改了之后
现在国产化上面的平台还没有编译成功
docker中编译成功
本地已经修改配置
  



```
1、download_hw.sh release 2.0.5 更新硬件库
2、download_umpl.sh develop-13.0.1.3 更新软件库
3、转码端修改video_mixer.cpp
4、编译转码库
5、cpresource.sh将所有的动态库依赖复制到新的release_gather_dir文件夹
6、修改demo.cpp ,添加tparam._performance_mode=TRANSCODERSDK_PERFORM_HARDWARE; 强制走硬件
7、修改demo的Makefile，链接参数修改如下：
		LINK_OPTION  =  -lpthread \
                -Wl,-rpath=$(G_ROOT)/release_gather_dir/ \
                -L$(G_ROOT)/system_wrappers/build/lib/aarch64-kylin/ -lsystem_wrappers \
                -L$(G_ROOT)/app/ -ltranscoder
8、编译demo.cpp
9、./launch.sh
```


docker搭建硬件环境，以某个镜像创建
```
/usr/bin/docker run --device=/dev/nvme0:/dev/nvme0 \
--device=/dev/nvme0n1:/dev/nvme0n1 \
--device=/dev/nvme1:/dev/nvme1 \
--device=/dev/nvme1n1:/dev/nvme1n1 \
--device=/dev/nvme2:/dev/nvme2 \
--device=/dev/nvme2n1:/dev/nvme2n1 \
--device=/dev/nvme3:/dev/nvme3 \
--device=/dev/nvme3n1:/dev/nvme3n1 \
--device=/dev/nvme4:/dev/nvme4 \
--device=/dev/nvme4n1:/dev/nvme4n1 \
--device=/dev/nvme5:/dev/nvme5 \
--device=/dev/nvme5n1:/dev/nvme5n1 \
--device=/dev/nvme6:/dev/nvme6 \
--device=/dev/nvme6n1:/dev/nvme6n1 \
--name=test-docker-yangpj --net=host -td -v /home/yangpj:/home registry.yealinkops.com/build-tools/cstack:1.1.0.3 /bin/bash
```

```
SetThreadAffinity(_work_thread, _param._affinity_cpus)
```


1、入avc和svc端



umpl 给定的分支打出来的tag develop-13.0.1.3
ma-hw release-uc-2.0.8



解码   ->塞给布局（混屏）->编码（压缩成h264码流）
验证转码塞进去的数据是否吐出来一致的数据

布局来取数据，但是却没有取到数据，目前得知_raw_media_map的数据为空

解码->混音/混屏(布局)->编码->转码


延时出帧：塞给硬件解码器，解码器解码会有一定的延时，这个时候就没办法判断哪些是已经使用过的帧数据，从而导致解码后的数据从buffer删除，导致布局从数据拿不到帧数据

开始转码，将通道数据和转码文件路径数据输入后，进入StartTranscoderImpl(),然后mediagather::IMediaDataGather创建实例，并且将通道数传入初始化，在初始化的时候会决定走硬件通道还是走软件通道，


LRUCache（Least Recently Used Cache）是一种常用的缓存算法，可以用于音视频开发中的数据缓存。该算法的基本思想是，将最近最少使用的数据从缓存中移除，以腾出空间存储新的数据。

video_mixer.cpp中的GetMediaData()获取布局后的数据



MP4：
https://zhuanlan.zhihu.com/p/594718441?utm_id=0
MP4由多个box组成，成树状结构，根结构下一般有4个box，ftyp,free,mdata,moov，
ftyp（File Type Box）
一般在文件的开始位置，描述的文件的版本、兼容协议等。
free（Free Space Box）
mdat（Media Data Box）
存放具体的媒体数据。数据结构的意义需要参考metadata（主要在sample table中描述）
moov（Movie Box）存储mp4文件的metadata信息，“moov”是一个container box，它包含mvhd、track和udta这三个子box。

mvhd（Movie Header Box）
track （Track Box）

mvhd：记录整个媒体文件的描述信息，如创建时间、修改时间、时间度量标尺、播放时长等
重要字段：
```
timescale：一秒包含的时间单位（整数）。举个例子，如果timescale等于1000，那么，一秒包含1000个时间单位（比如track的duration为10,000，那么，track的实际时长为10,000/1000=10s）；
duration：影片时长（整数），根据文件中的track的信息推导出来，等于时间最长的track的duration；
rate：推荐的播放速率，32位整数，高16位、低16位分别代表整数部分、小数部分（[16.16]），举例 0x0001 0000 代表1.0，正常播放速度；
volume：播放音量，16位整数，高8位、低8位分别代表整数部分、小数部分（[8.8]），举例 0x01 00 表示 1.0，即最大音量；
matrix：视频的转换矩阵，一般可以忽略不计；

next_track_ID：32位整数，非0，一般可以忽略不计。当要添加一个新的track到这个影片时，可以使用的track id，必须比当前已经使用的track id要大。也就是说，添加新的track时，需要遍历所有track，确认可用的track id；
```

track(track是container box，至少包含两个子box：tkhd和mdia)：记录媒体流信息，文件中可以存在一个或多个 track，它们之间是相互独立的。一般的包含一个视频track和一个音频track。
重要的字段：
```
视频：
packets：包含的packets的数量
steam type: 流的类型，比如AVC/H.264 、 AAC
profile: 编码器的profile，如High、Base等
level: 编码器的level
width: 宽
height: 高
aspect ratio: 纵横比， 5:9

音频：
sample rate： 采样率
channels: 声道数
```



track里面的子box：tkhd（Track Header Box）
包含关于媒体流的头信息，跟track中的更细化了！
重要字段：
```
Track_enabled：值为0x000001，表示这个track是启用的，当值为0x000000，表示这个track没有启用；

Track_in_movie：值为0x000002，表示当前track在播放时会用到；

Track_in_preview：值为0x000004，表示当前track用于预览模式；

creation_time：当前track的创建时间；

modification_time：当前track的最近修改时间；

track_ID：当前track的唯一标识，不能为0，不能重复；

duration：当前track的完整时长（需要除以timescale得到具体秒数）；

layer：视频轨道的叠加顺序，数字越小越靠近观看者，比如1比2靠上，0比1靠上；

alternate_group：当前track的分组ID，alternate_group值相同的track在同一个分组里面。同个分组里的track，同一时间只能有一个track处于播放状态。当alternate_group为0时，表示当前track没有跟其他track处于同个分组。一个分组里面，也可以只有一个track；

volume：audio track的音量，介于0.0~1.0之间；

matrix：视频的变换矩阵；

width、height：视频的宽高；
```