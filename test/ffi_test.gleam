import gleeunit/should

import ffi

pub fn runtime_test() {
  ffi.runtime()
  |> should.equal(ffi.ErlangRuntime)
}

pub fn exec_example_test() {
  ffi.exec(".", "echo", [], [])
  |> should.equal(0)
}
