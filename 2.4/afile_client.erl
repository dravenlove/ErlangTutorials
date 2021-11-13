%%(4) �����ļ��ͻ��˺ͷ��������롣����һ����Ϊput_file���������Ҫ��Ӻ�����Ϣ��ѧϰ��β����ֲ�ҳ�������ֲ�ҳ���fileģ�顣 


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


	