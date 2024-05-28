# dn_shell

[![Package Version](https://img.shields.io/hexpm/v/dn_shell)](https://hex.pm/packages/dn_shell)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/dn_shell/)

```sh
gleam add dn_shell
```

```gleam
import dn_shell

pub fn main() {
  // TODO: An example of the project in use
}
```

Further documentation can be found at <https://hexdocs.pm/dn_shell>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
gleam shell # Run an Erlang shell
```

```zsh
export MY_SHELL=$(basename $SHELL)
rebar3 completion -s $MY_SHELL -f autocomplete_rebar3.$MY_SHELL
source _build/default/autocomplete_rebar3.$MY_SHELL
```
