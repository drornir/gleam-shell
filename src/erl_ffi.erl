-module(erl_ffi).

-export([runtime_bit_array/0, do_exec/4, do_test/0]).
% -export([do_test/0]).

do_test() -> {}.

do_exec(Cwd, Executable, Args, EnvList) ->

	{ok, {0}}.

runtime_bit_array() ->
	<<"erlang"/utf8>>.

% -spec exec_erlang_ffi(string(), string(), [string()], [{string(), string()}]) ->
% 	{ok, string()} | {error, string()}.

% -spec do_exec(binary(), binary(), binary(),binary()) ->
% 	{ok, {binary(), binary(), binary(),binary()}}.


% exec_erlang_ffi() ->
% 	{ok, "was ok"}.
