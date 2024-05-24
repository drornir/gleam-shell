import gleam/dict
import gleam/result

pub type Command {
  Command(
    name: String,
    cwd: String,
    args: List(String),
    env: dict.Dict(String, String),
    stdin: IOWriter,
    stdout: IOReader,
    stderr: IOReader,
  )
}

// CommandOpt is used to configure a Command. CommandOpts are applied first to last,
// in order.
pub type CommandOpt {
  // Appends strings to the command args array
  Args(List(String))
  // Convenience method equivaluent to Args(["--"<>key, value]).
  // This does not unset an existing flag TODO(dror): maybe it's just annoying?
  FlagL(key: String, value: String)
  // Convenience method equivaluent to Args(["-"<>key, value]).
  // This does not unset an existing flag TODO(dror): maybe it's just annoying?
  FlagS(key: String, value: String)
  // Adds and environmental variable value.
  // Will unset any existing env var
  Env(key: String, value: String)
  // Will unset any existing env var
  EnvMany(kvs: dict.Dict(String, String))
  Stdin(IOReader)
  Stdout(IOWriter)
  Stderr(IOWriter)
  // Set current working directory. Defaults to this proccess cwd (aka ".").
  CurrentWorkingDirectory(String)
  // Set environmental variables from parent process
  UseParentProccessEnv
}

pub fn new_cmd(name: String, opts: List(CommandOpt)) -> Result(Command, Err) {
  todo
}

pub fn start(cmd: Command) -> Result(RunningCommand, Err) {
  todo
}

// todo
pub type IOWriter {
  IOWriter
}

// todo
pub type IOReader {
  IOReader
}

pub type RunningCommand {
  RunningCommand(cmd: Command, runtime: RuntimeCommand)
}

pub type CommandStatus {
  StatusRunning
  StatusStopped
}

pub type Err {
  PreparingCommandError
}

// RuntimeCommand is the platform specific part of the command
pub type RuntimeCommand {
  ErlangCommand
  JSCommand
}
