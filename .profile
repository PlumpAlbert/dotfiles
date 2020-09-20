export VISUAL=nvim
export EDITOR=nvim
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts:$GOPATH/bin"

# Start ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1d > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi
