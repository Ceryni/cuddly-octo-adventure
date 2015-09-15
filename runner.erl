-module(runner).


-export([run/0]).

-spec run() -> ok.
run() ->
  io:format("~p", [no_spec_dude:hey_dude(42)]),
  io:format("~p", [spec_dude:hey_dude(42)]).
