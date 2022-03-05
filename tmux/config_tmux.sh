#!/bin/bash

set -euo pipefail

#set -x

is_app_installed() {
	type "$1" &> /dev/null
}

if ! is_app_installed tmux; then
	printf "WARNING: \"tmux\" is not installed!"
	exit 1
fi

if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
	printf "WARNING: TPM (Tmux plugins mananger is no installed!)"

	# install tpm
	git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
fi

# link tmux config file
if [ ! -e "$HOME/.tmux.conf" ]; then
	ln -sf ./tmux.conf "$HOME"/.tmux.conf
fi

printf "Install tmux plugins"
tmux new -d -s __noop >/dev/null 2>&1 || true
tmux set-environment -g TMUX_PLUGIN_MANAGER_PATH "~/.tmux/plugins"
"$HOME"/.tmux/plugins/tpm/bin/install_plugins || true
tmux kill-session -t __noop >/dev/null 2>&1 || true

printf "OK: tmux config complete."
