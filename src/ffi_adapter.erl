-module(ffi_adapter).

-export([runtime/0]).

runtime_bit_array() ->
	<<"erlang"/utf8>>.

-spec exec(string(), string(), [string()], [{string(), string()}]) ->
	{ok, integer()} | {error, string()}.

exec(Cwd, Executable, Args, EnvList) ->
	{ok, 0}.
