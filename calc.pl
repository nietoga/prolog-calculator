:- use_module(tokens, [tokens/2]).
:- use_module(parser, [expr/3]).
:- use_module(ast, [eval/2]).

calculator(String, R) :-
    tokens(String, Tokens),
    expr(Expr, Tokens, []),
    eval(Expr, R).
