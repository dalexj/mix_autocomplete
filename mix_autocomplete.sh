__setup_mix_autocomplete() {
  if ! type mix &> /dev/null; then
    return
  fi

  if [ -e mix.exs ]; then
    complete -W "$(
      mix run -e '
        Mix.Task.load_all
          |> Enum.map(&(Mix.Task.task_name &1))
          |> Enum.sort
          |> Enum.join(" ")
          |> IO.puts
      '
    )" mix
  else
    complete -W "" mix
  fi
}
cd() {
  builtin cd "$@" || return
  __setup_mix_autocomplete
}

__setup_mix_autocomplete
