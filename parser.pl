:- module(parser, [expr/3]).

:- use_module(tokens, [token/3]).

expr(Expr) --> addsubexpr(Expr).

addsubexpr(Expr) --> muldivexpr(LeftExpr), restaddsubexpr(LeftExpr, Expr).

restaddsubexpr(Expr, Expr) --> [].
restaddsubexpr(LeftExpr, Expr) --> operator(add), addsubexpr(RightExpr), restaddsubexpr(add(LeftExpr, RightExpr), Expr).
restaddsubexpr(LeftExpr, Expr) --> operator(sub), addsubexpr(RightExpr), restaddsubexpr(sub(LeftExpr, RightExpr), Expr).

muldivexpr(Expr) --> num(LeftExpr), restmuldivexpr(LeftExpr, Expr).
muldivexpr(Expr) --> symbol(lparen), addsubexpr(Expr), symbol(rparen).

restmuldivexpr(Expr, Expr) --> [].
restmuldivexpr(LeftExpr, Expr) --> operator(div), muldivexpr(RightExpr), restmuldivexpr(div(LeftExpr, RightExpr), Expr).
restmuldivexpr(LeftExpr, Expr) --> operator(mul), muldivexpr(RightExpr), restmuldivexpr(mul(LeftExpr, RightExpr), Expr).

num(num(Val)) --> [Val], { token(literal, num, Val) }.
operator(Name) --> [Op], { token(symbol, Name, Op) }.
symbol(Name) --> [Sym], { token(symbol, Name, Sym) }.
