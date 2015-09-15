-module(spec_dude).

-behaviour(dude).

-export([hey_dude/1]).

-spec hey_dude(Say :: string()) -> Res :: string().
hey_dude(Say) ->
  lists:flatten(io_lib:format("Hey Dude, ~p", [Say])).
