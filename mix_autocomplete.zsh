#!/usr/bin/env zsh

if [[ ! -o interactive ]]; then
    return
fi


function _mix() {
  if [[ ! -e "mix.exs" ]]; then
    return
  fi

  local mix_md5
  local completions
  local current_mix_md5=`md5 -q mix.exs`
  local recalculate=true

  if _retrieve_cache mix; then
    if [[ $mix_md5 == $current_mix_md5 ]]; then
      recalculate=false
    fi
  fi

  if [[ $recalculate == "true" ]]; then
    mix_md5=$current_mix_md5

    # Pre-compile the project and check status
    mix compile >/dev/null 2>&1
    if [[ $? -eq 1 ]]; then
      # Project compilation failed --
      # show a message explaining why we can't show completions?
      return 1
    fi

    completions="$(
        mix run -e '
          Mix.Task.load_all
            |> Enum.map(&(Mix.Task.task_name &1))
            |> Enum.sort
            |> Enum.join(" ")
            |> IO.puts
        ')"

    _store_cache mix mix_md5 completions
  fi

  _arguments "1: :(${completions})"
}

compdef _mix mix
