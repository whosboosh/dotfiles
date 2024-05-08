if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/usr/local/lib"

set -U fish_user_paths "/usr/local/cuda-12/bin:$PATH"


set TERM "xterm"
set EDITOR "vim"
