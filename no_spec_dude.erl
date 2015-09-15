-module(no_spec_dude).

-behaviour(dude).

-export([hey_dude/1]).

hey_dude(Say) ->
  lists:flatten(io_lib:format("Hey Dude, ~p", [Say])).
