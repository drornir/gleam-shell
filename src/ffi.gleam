import gleam/bit_array
import gleam/dynamic
import gleam/erlang/atom
import gleam/io
import gleam/result

pub type ExecStarted {
  ExecStarted(pid: Int)
}

/// Unexpected errors should result in the user crashing the thread,
///  in order to kill any resources bound to it by the ffi
pub type ExecError {
  UnexpectedFFIError(msg: String)
  UnexpectedDecodeFFIError(
    msg: String,
    value: dynamic.Dynamic,
    decode_errs: List(dynamic.DecodeError),
  )
  /// ErlangExecError value needs to be parsed by TODO
  ErlangExecError(dyn_value: DynamicErlangExecResult)
}

type DynamicErlangExecResult =
  dynamic.Dynamic

@target(erlang)
pub fn execute(
  cwd cwd: String,
  cmd cmd: String,
  args args: List(String),
  env env: List(#(String, String)),
) -> Result(ExecStarted, ExecError) {
  // TODO validate arguments, expand env?, verify cwd exists and is a dir,
  // env keys are valid shell var names LIKE_THIS or_THis,
  //
  unsafe_exec_erlang_ffi(cwd, cmd, args, env)
  |> parse_unsafe_exec_erlang_ffi()
}

@target(erlang)
/// the ffi function itself. use with your own risk
@external(erlang, "erl_ffi", "do_exec")
pub fn unsafe_exec_erlang_ffi(
  cwd cwd: binary,
  cmd cmd: binary,
  args args: List(binary),
  env env: List(#(binary, binary)),
) -> dynamic.Dynamic

@target(erlang)
pub fn parse_unsafe_exec_erlang_ffi(
  unsafe_ffi_result: dynamic.Dynamic,
) -> Result(ExecStarted, ExecError) {
  let dyn_parser =
    dynamic.result(
      ok: dynamic.decode1(ExecStarted, dynamic.element(0, dynamic.int)),
      error: dynamic.decode1(
        ErlangExecError,
        dynamic.element(0, dynamic.dynamic),
      ),
    )
  case dyn_parser(unsafe_ffi_result) {
    Ok(d) -> d
    Error(decode_errs) ->
      Error(UnexpectedDecodeFFIError(
        msg: "parsing the result of 'unsafe_exec_erlang_ffi' into Result(ExecStarted, ExecError)",
        value: unsafe_ffi_result,
        decode_errs: decode_errs,
      ))
  }
}

// TODO remove below this line, it was just a ffi tests
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

pub type Runtime {
  ErlangRuntime
  JSRuntime
}

pub fn runtime() -> Runtime {
  case runtime_bit_array() {
    <<"erlang":utf8>> -> ErlangRuntime
    <<"javascript":utf8>> -> JSRuntime
    any -> {
      panic as case bit_array.to_string(any) {
        Ok(got) -> "runtime is misconfigured: got " <> got
        Error(Nil) -> "runtime is misconfigured: invalid UTF-8 data"
      }
    }
  }
}

/// the ffi function itself. use with your own risk
@external(erlang, "erl_ffi", "runtime_bit_array")
pub fn runtime_bit_array() -> BitArray
