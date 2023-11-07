-module(observer_example_worker).
-export([start_link/0]).
-behaviour(gen_server).
-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3
]).

start_link() ->
    gen_server:start_link(?MODULE, [], []).

init(_) ->
    maybe_set_label(?MODULE),
    {ok, undefined}.

maybe_set_label(Label) ->
    maybe_set_label(Label, erlang:function_exported(proc_lib, set_label, 1)).

% UNCOMMENT THIS TO SET THE LABEL AND SEE THE BUG
% maybe_set_label(Label, true) ->
%     proc_lib:set_label(Label);
maybe_set_label(_Label, _) ->
    skip.

handle_call(_Req, _From, State) ->
    {reply, ok, State}.

handle_cast(_Req, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_, _) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
