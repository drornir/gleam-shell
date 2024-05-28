import gleam/dynamic
import gleam/io

import gleeunit/should

import ffi

pub fn runtime_test() {
  ffi.runtime()
  |> should.equal(ffi.ErlangRuntime)
}

pub fn exec_ffi_is_defined_test() {
  let _ = ffi.exec_erlang_ffi("", "", [], [])
}

pub fn execute_test() {
  ffi.execute("a", "b", [], [])
  // dynamic.from(#("", ""))
  |> should.equal(Ok(ffi.ExecStarted(pid: 0)))
}
// pub fn exec_example_test() {
//   ffi.execute(".", "echo", [], [])
//   |> should.equal(Ok(ffi.ExecStarted(pid: 0)))
// }
