-record(test1, {i1 =1,i2=2,i3=3}).

-record(test, {
	id = 0
	,id1 = 1
	,id2 = 2
	,id3 = [#test1{ i1 = 11 ,i2 =12 ,i3=13 }]
	,id4 = []}).