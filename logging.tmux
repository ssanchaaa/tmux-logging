#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$CURRENT_DIR/scripts/variables.sh"
source "$CURRENT_DIR/scripts/shared.sh"

main() {
    tmux bind-key "$logging_key" run-shell "$CURRENT_DIR/scripts/toggle_logging.sh"
    tmux bind-key "$pane_screen_capture_key" run-shell "$CURRENT_DIR/scripts/screen_capture.sh"
    tmux bind-key "$save_complete_history_key" run-shell "$CURRENT_DIR/scripts/save_complete_history.sh"
    tmux bind-key "$clear_history_key" run-shell "$CURRENT_DIR/scripts/clear_history.sh"

    # запускать логирование при создании нового окна или панели
    tmux set-hook -g after-new-window 'run -b "$CURRENT_DIR/scripts/toggle_logging.sh"'
    tmux set-hook -g after-split-window 'run -b "$CURRENT_DIR/scripts/toggle_logging.sh"'
}

main
