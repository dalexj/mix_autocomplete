#!/usr/bin/env zsh

if [[ ! -o interactive ]]; then
    return
fi

compctl -K _mix mix

_mix() {
  local completions
  completions="$(
      mix run -e '
        Mix.Task.load_all
          |> Enum.map(&(Mix.Task.task_name &1))
          |> Enum.sort
          |> Enum.join("\n")
          |> IO.puts
      ')"

  reply=("${(ps:\n:)completions}")
}
