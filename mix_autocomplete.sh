_mix() {
  if ! type mix &> /dev/null || ! [ -e mix.exs ]; then
    return
  fi

  local current_mix_md5

  if type "md5" &>/dev/null; then
    current_mix_md5=`md5 -q mix.exs`
  elif type "md5sum" &>/dev/null; then
    current_mix_md5=`md5sum mix.exs | awk '{ print $1 }'`
  else
    # no either md5 or md5sum
    return 1
  fi

  if [[ $current_mix_md5 != $_last_mix_md5 ]]; then
    mix compile >/dev/null 2>&1
    if [[ $? -eq 1 ]]; then
      # Project compilation failed --
      # show a message explaining why we can't show completions?
      return 1
    fi
    _last_mix_md5=$current_mix_md5
    _mix_task_list="$(
      mix run -e '
        Mix.Task.load_all
          |> Enum.map(&(Mix.Task.task_name &1))
          |> Enum.sort
          |> Enum.join(" ")
          |> IO.puts
      '
    )"
  fi

  cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$_mix_task_list" $cur) )
  return 0
}
complete -o bashdefault -o default -o nospace -F _mix mix
