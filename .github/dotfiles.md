# [`dotfiles.fish`](../.config/fish/functions/dotfiles.fish)

Simple Git wrapper for managing dotfiles.

- Setup and use like plain Git
- Enjoy the same completions with Git

> Want a more comprehensive feature set? Check out [yadm](https://github.com/TheLocehiliosan/yadm).

## Usage

Setup a dotfiles repository is as intuitive as a regular one.

1. Navigate to the folder you want to track, for example `cd ~`.
2. Init the repository with `dotfiles init`. You can also specify any `git init` options, including a different directory, for example `dotfiles init --quiet ~/.dotfiles`.

   - If no directory is specified, the repository will be initialized in `$XDG_CONFIG_HOME/dotfiles`, or `~/.config/dotfiles`.
   - You can always get the location of the repository via `$dotfiles` variable.

3. Now start adding files to track with `dotfiles add path/to/file`, commit with `dotfiles commit` and you've got it 😉
4. Want to access your dotfiles in a new environment? Just `dotfiles pull <remote>` and if there's no conflict, you are good to go!

## Move dotfiles repository to a new location

1. Move it!
2. `set -U dotfiles path/to/location`

