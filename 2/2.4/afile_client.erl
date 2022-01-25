%%(4) 运行文件客户端和服务器代码。加入一个名为put_file的命令。你需要添加何种消息？学习如何查阅手册页。查阅手册页里的file模块。 


-module(afile_client).
-export([ls/2,get_file/2,put_file/3]).

ls(Server,Dir) ->
	Server ! {self(),{list_dir,Dir}},
	receive
		{Server,FileList} ->
			io:format("~p",[FileList])
	end.

put_file(Server,Content1,Filedir) ->
		
	Server ! {self(),{put_file,Content1,Filedir}},
	receive
		{Server,Content} ->
			Content
	end.

get_file(Server,File) ->
	Server ! {self(),{get_file,File}},
	receive
		{Server,Content}	->
			Content
	end.


	