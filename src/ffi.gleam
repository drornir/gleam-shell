import gleam/bit_array
import gleam/io
import gleam/result

pub type ExecStart {
  ExecStart
}

pub fn exec(
  cwd cwd: String,
  cmd cmd: String,
  args args: List(String),
  env env: List(#(String, String)),
) -> ExecStart {
  todo
}

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

@external(erlang, "ffi_adapter", "runtime_bit_array")
fn runtime_bit_array() -> BitArray
