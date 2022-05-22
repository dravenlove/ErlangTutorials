%%(4) 运行文件客户端和服务器代码。加入一个名为put_file的命令。你需要添加何种消息？学习如何查阅手册页。查阅手册页里的file模块。 

-module(afile_server).
-export([start/0,loop/0]).

%% register本质上给进程pid注册一个名字为ccc.
%% spawn(节点(), 函数)返回进程pid,生成一个在节点上运行的新进程

%% 节点相当于一个erlang实例,相互隔离但可以相互通信
start()-> register(ccc,spawn(afile_server,loop,[])).

loop()->
	receive
		{Client,{list_dir,Dir}} ->
			Client ! {self(),file:list_dir(Dir)};

		{Client,{put_file,Filecontent,Filendir}} ->
			{ok,Filename2}=file:open(Filendir, [write]),
			file:write(Filename2,Filecontent),
			file:close(Filename2),
			Client !{self(),save};
			
		{Client,{get_file,Dir,File}} ->
			Full = filename:join(Dir,File),
			Client !{self(),file:read_file(Full)}
		end,
		loop().