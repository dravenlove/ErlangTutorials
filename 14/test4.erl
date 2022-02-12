%% lib_chan两台主机需要连接分布式组群
%% 在服务端用start_server(Conf),包括监听端口和服务名和密码以及启动的MFA
%% 客户端用connect(Host, Port, S, P, Arg)会开启host上的端口并用密码调用对应模块
%% connect()函数建立连接后,分裂出两个代理进程,这些进程负责把erlang消息转换成TCP包
%% lib_chan会将收到的消息自动添加chan, 代理进程Pid 让程序设计者不用关注这些交由代理进程完成
