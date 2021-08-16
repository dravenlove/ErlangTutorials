%%(1) 扩展geometry.erl。添加一些子句来计算圆和直角三角形的面积。添加一些子句来计算各种几何图形的周长。


-module(geometry).
-export([area/2,area/3]).

area(circle,Radius)->
	3.1415*Radius*Radius.

area(square,Radius)->
	3.1415*Radius*Radius.


area(triangle,Width,Height)->
	Width*Height/2.

area(rectangle,Width,Height)->
	Width*Height.