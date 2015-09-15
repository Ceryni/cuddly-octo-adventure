-module(dude).

-callback hey_dude(Say :: string()) -> Res :: string().
