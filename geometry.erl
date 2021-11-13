-module(geometry).
-export([area/3,length/3]).



area(circle,Radius,Radius) ->
	3.1415926*Radius*Radius;
area(rectangle,Width,Height) ->
	Width*Height/2.

length(circle,Radius,Radius) ->
	        2*3.1415926*Radius;
length(rectangle,Width,Height) ->
	Width+Height+math:sqrt(Width*Width+Height*Height).

