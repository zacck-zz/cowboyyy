-module(delivery_handler).
-include_lib("kernel/include/logger.hrl").

-export([init/2]).


init(Req, Opts) ->
	Req1 = cowboy_req:reply(200,
												 #{<<"content-type">> => <<"text/plain">>},
	<<"Recieved Delivery Report">>,
	Req),

	logger:notice("Delivery Report From ~p", [maps:get(qs, Req)]),
{ok, Req1, Opts}.
