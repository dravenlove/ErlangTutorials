%%(4) 运行文件客户端和服务器代码。加入一个名为put_file的命令。你需要添加何种消息？学习如何查阅手册页。查阅手册页里的file模块。 

-module(afile_server).
-export([start/1,loop/1]).

start(Dir) -> spawn(afile_server,loop,[Dir]).

loop(Dir) ->
	receive
		{Client,list_dir} ->
			Client ! {self(),file:list_dir(Dir)};

		{Client,{put_file,File},Filename} ->
			Filename1=[$.,$/]++Filename,
			file:open(Filename1, [write]),
			file:copy(File,Filename1),
			Client !{self(),save};
			
		{Client,{get_file,File}} ->
			Full = filename:join(Dir,File),
			Client !{self(),file:read_file(Full)}
		end,
		loop(Dir).