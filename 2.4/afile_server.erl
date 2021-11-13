%%(4) �����ļ��ͻ��˺ͷ��������롣����һ����Ϊput_file���������Ҫ��Ӻ�����Ϣ��ѧϰ��β����ֲ�ҳ�������ֲ�ҳ���fileģ�顣 

-module(afile_server).
-export([start/0,loop/0]).

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