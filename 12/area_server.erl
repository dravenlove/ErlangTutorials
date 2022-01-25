-module(area_server).
-export(
        [loop/0
        ,rpc/2]).

%% 客户端代码,他是用来想服务端发送请求,并输出返回值
rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        Response ->
            Response
    end.

%% 服务端代码,这是用来接收客户端发送过来的代码并进行处理,然后返回给服务端并开始下一次运行
loop() ->
    receive
        {From, {rectangle, Width, Ht}} ->
            From ! Width * Ht,
            loop();
        {From, {circle, R}} ->
            From ! 3.1415 * R * R,
            loop();
        {From, Other} ->
            From ! {error, Other},
            loop()
    end.

%% 因为可能会受到其他信息导致错乱响应所以要对其判断
rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
        {Pid, Response} ->
            Response
    end.

loop() ->
    receive
        {From, {rectangle, Width, Ht}} ->
            From ! {self(), Width * Ht),
            loop();
        {From, {circle, R}} ->
            From ! {self(), 3.1415 * R * R},
            loop();
        {From, Other} ->
            From ! {error, Other},
            loop()
    end.