:- module(tokens, [lex/2, tokens/2]).

lex(add, '+').
lex(sub, '-').
lex(mul, '*').
lex(div, '/').
lex(lparen, '(').
lex(rparen, ')').
lex(num, Val) :- number(Val).

tokens(String, Tokens) :- phrase(tokens(Tokens), String).

tokens([]) --> [].
tokens(Tokens) --> whitespaces, tokens(Tokens).
tokens([Number | Tokens]) --> number(NumberChars), !, tokens(Tokens), { number_chars(Number, NumberChars) }.
tokens([Symbol | Tokens]) --> lexeme(Symbol), tokens(Tokens).

whitespaces --> [W], { char_type(W, space) }.

number([D | Ds]) --> digit(D), digits(Ds).

digits([D | Ds]) --> digit(D), digits(Ds).
digits([]) --> [].

digit(D) --> [D], { char_type(D,digit) }.
lexeme(SymbolChars) --> [Symbol], { lex(_, Symbol), atom_chars(SymbolChars, [Symbol]) }.
