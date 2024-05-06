:- module(tokens, [token/3, tokens/2]).

token(symbol, add, "+").
token(symbol, sub, "-").
token(symbol, mul, "*").
token(symbol, div, "/").
token(symbol, lparen, "(").
token(symbol, rparen, ")").
token(literal, num, Val) :- number(Val).

tokens(String, Tokens) :- string_chars(String, Chars), phrase(tokens(Tokens), Chars).

tokens([]) --> [].
tokens(Tokens) --> whitespaces, tokens(Tokens).
tokens([Number | Tokens]) --> number(NumberChars), !, tokens(Tokens), { number_chars(Number, NumberChars) }.
tokens([SymbolString | Tokens]) --> symbol(SymbolString), tokens(Tokens).

whitespaces --> [W], { char_type(W, space) }.

number([D | Ds]) --> digit(D), digits(Ds).

digits([D | Ds]) --> digit(D), digits(Ds).
digits([]) --> [].

digit(D) --> [D], { char_type(D,digit) }.

symbol(SymbolString) --> [SymbolChar], { token(symbol, _ , SymbolString), string_chars(SymbolString, [SymbolChar]) }.
