-module(survey_handler).
-include_lib("kernel/include/logger.hrl").

-export([init/2]).


init(Req, Opts) ->
	Response = #{<<"say">> => <<"Nice we are using call to API">>,
							 <<"options">> => #{
									 <<"speechRate">> => 1,
									 <<"language">> => <<"en">>,
									 <<"voice">> => #{
											 <<"name">> => <<"Joana">>,
											 <<"gender">> => <<"female">>
											}
									}
							},
	Req1 = cowboy_req:reply(200,
												 #{<<"content-type">> => <<"application/json">>},
	jiffy:encode(Response),
	Req),

	logger:notice("Request Data ~p", [maps:get(qs, Req)]),
{ok, Req1, Opts}.
