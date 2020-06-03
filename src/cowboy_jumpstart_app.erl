%%%-------------------------------------------------------------------
%% @doc cowboy_jumpstart public API
%% @end
%%%-------------------------------------------------------------------

-module(cowboy_jumpstart_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
	Dispatch = cowboy_router:compile(
							 [{'_', [{"/", survey_handler, []},
											 {"/delivery", delivery_handler, []}
											]}]),
	{ok, _} = cowboy:start_clear(my_http_listener,
															 [{port, 9090}],
															 #{env => #{dispatch => Dispatch}}
															),
    cowboy_jumpstart_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
