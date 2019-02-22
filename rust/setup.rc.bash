RUST_ENV=~/.cargo/env

# shellcheck source=/dev/null
test -f $RUST_ENV && source $RUST_ENV

# shellcheck source=/dev/null
export PATH="$HOME/.cargo/bin:$PATH"
