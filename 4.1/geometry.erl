%%(1) ��չgeometry.erl�����һЩ�Ӿ�������Բ��ֱ�������ε���������һЩ�Ӿ���������ּ���ͼ�ε��ܳ���

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

%%�����и�����Ҫ�ĵ�.
%%Erlang���ع�������;�Ž���,�������һ���ع�������.����.
