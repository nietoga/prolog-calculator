:- module(ast, [eval/2]).

eval(add(LeftExpr, RightExpr), Result) :- eval(LeftExpr, LeftResult), eval(RightExpr, RightResult), Result is LeftResult + RightResult.
eval(sub(LeftExpr, RightExpr), Result) :- eval(LeftExpr, LeftResult), eval(RightExpr, RightResult), Result is LeftResult - RightResult.
eval(mul(LeftExpr, RightExpr), Result) :- eval(LeftExpr, LeftResult), eval(RightExpr, RightResult), Result is LeftResult * RightResult.
eval(div(LeftExpr, RightExpr), Result) :- eval(LeftExpr, LeftResult), eval(RightExpr, RightResult), Result is LeftResult / RightResult.
eval(num(Val), Val).
