fish_vi_key_bindings

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

set --global hydro_color_pwd #000000

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo 'N'
    case insert
      set_color --bold green
      echo 'I'
    case replace_one
      set_color --bold green
      echo 'R'
    case visual
      set_color --bold brmagenta
      echo 'V'
    case '*'
      set_color --bold red
      echo '?'
  end
  set_color normal
end

function fish_prompt
   echo (pwd)'> '
end

set fish_greeting

function git_add_deleted
    git status | grep "deleted:" | cut -d':' -f2  | xargs -t   -I {}  git add  -u "{}"
end

alias ww="cc -Wall -Wextra -Werror "

