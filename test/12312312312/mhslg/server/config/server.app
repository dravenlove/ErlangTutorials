{
	application, server,
	[
		{description, "公共游戏服"},
		{vsn, "1.0.0"},
		{modules,[main, server_app, server_sup]},
		{registered, [server_sup]},
		{applications, [kernel, stdlib, sasl]},
		{mod, {server_app, []}},
		{start_phases, []},
		{env, [
			{author, "glendy"}
		]}
	]
}.