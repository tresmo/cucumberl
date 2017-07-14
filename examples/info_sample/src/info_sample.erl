-module(info_sample).

-export([setup/1, teardown/1, scenario_setup/2, scenario_teardown/1,
         given/3, 'when'/3, then/3, main/0]).

-export([enter/2, press/2]).

setup(Info) ->
    io:format(standard_error, "info_sample:setup() Info: ~p\n", [Info]),
    [].

scenario_setup(_State, Info) ->
    io:format(standard_error, "info_sample:scenario_setup() Info: ~p\n", [Info]),
    [].

%% Step definitions for the sample calculator Addition feature.
given([i, have, entered, N, into, the, calculator], State, _) ->
    {ok, enter(State, list_to_integer(atom_to_list(N)))}.

'when'([i, press, Op], State, _) ->
    {ok, press(State, Op)}.

then([the, result, should, be, Result, on, the, screen],
     State, _) ->
    list_to_integer(atom_to_list(Result)) =:=State.

scenario_teardown(_State) ->
    io:format(standard_error, "info_sample:scenario_teardown()\n", []),
    [].

teardown(_State) ->
    io:format(standard_error, "info_sample:teardown()\n", []),
    ok.

%% Implementing a simple model here...

enter(State, N) ->
    [N|State].

press(State, add) ->
    add(State);
press(State, multiply) ->
    multiply(State).

add([X, Y]) ->
    X + Y.

multiply([X, Y]) ->
    X * Y.



%% A main() to kick it all off...

main() ->
    cucumberl:run("./features/info_sample.feature").

