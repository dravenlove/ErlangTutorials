%%(1) 扩展geometry.erl。添加一些子句来计算圆和直角三角形的面积。添加一些子句来计算各种几何图形的周长。

-module(geometry).
-export([area/2,area/3,circumference/2,circumference/3]).

area(circle,Radius)->
	3.1415*Radius*Radius;

area(square,Length)->
	Length*Length.

area(triangle,Width,Height)->
	Width*Height/2;

area(rectangle,Width,Height)->
	Width*Height.

circumference(circle,Radius)->
	2*3.1415*Radius.

circumference(triangle,Width,Height)->
	Width+Height+math:sqrt(math:pow(Width,2)+math:pow(Height,2)).

%%这里有个很重要的点.
%%Erlang的重构函数用;号结束,但是最后一个重构函数用.结束.
