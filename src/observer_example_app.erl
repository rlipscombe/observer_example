%%%-------------------------------------------------------------------
%% @doc observer_example public API
%% @end
%%%-------------------------------------------------------------------

-module(observer_example_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    {ok, Pid} = observer_example_sup:start_link(),
    lists:foreach(
        fun(_) ->
            {ok, _} = supervisor:start_child(Pid, [])
        end,
        lists:seq(1, 5)
    ),
    {ok, Pid}.

stop(_State) ->
    ok.

%% internal functions
