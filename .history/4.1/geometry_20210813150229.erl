-module(geometry).
-export([area/2,area/3]).

area(circle,Radius)->
	3.1415*Radius*Radius.

area(triangle,Width,Height)->
	Width*Height/2.