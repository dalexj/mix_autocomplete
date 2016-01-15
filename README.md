# Mix Autocomplete
Shell script to give autocomplete options for mix tasks in elixir development

# Setup for Bash
1. Copy the `mix_autocomplete.sh` script into a known location such as `~/.mix_autocomplete.sh`
2. Execute the file within your `.bash_profile` with `source ~/.mix_autocomplete.sh`

# Setup for ZSH
1. Copy the `mix_autocomplete.zsh` script into a known location such as `~/.mix_autocomplete.zsh`
2. Execute the file within your `.zshrc` with `source ~/.mix_autocomplete.zsh`

# Staying up to date with the script
Yes, there are issues with this and features that have not been implemented.
As it gets built you can stay up to date by either cloning this repo and adding a symlink:
```
ln -s path/to/where/you/cloned/mix_autocomplete.sh ~/.mix_autocomplete.sh
```
or use a git submodule if you use a common `dotfiles` repo for yourself:
```bash
git submodule add git@github.com:dalexj/mix_autocomplete.git mix_autocomplete # ssh
git submodule add https://github.com/dalexj/mix_autocomplete.git mix_autocomplete # https
ln -s your/dotfiles/mix_autocomplete/mix_autocomplete.sh ~/.mix-autocomplete.sh
```

and stay up to date with `cd mix_autocomplete && git pull`

# Contribute

Open a pull request or issue, no formalities are needed
