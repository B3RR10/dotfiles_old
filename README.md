# dotfiles

Repository to keep my dotfiles up to date.

The dotfiles are managed as a bare repository based on this [link](https://www.atlassian.com/git/tutorials/dotfiles)

The command `c='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'` is used to treat the home directory as the root of the git repository. The file `~/.config/zsh/dotfiles_alias.zsh` contains some helping aliases for ease of use.

## Installation

To install the dotfiles in a new system, follow the steps:

- Define the alias in the current scope

```sh
alias c='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

- Add the git directory to the ignored files

```sh
echo ".dotfiles" > .gitignore
```

- Clone the repository as a --bare repo

```sh
git clone --base <git-repo-url> $HOME/.dotfiles
```

- Checkout the actual content from the bare repository to your $HOME

```sh
c checkout
```

This step may fail because the $HOME directory may already have some files that the git command want to overwrite. The solution is to backup those files and remove them. Then run the command again.

- Set the flag `showUntrackedFiles` to `no` on this specific repository

```sh
c config --local status.showUntrackedFiles no
```

- Your dorfiles are ready. You can now change your files and commit them...

```sh
c status
ca .vimrc
cc -m "Add vimrc"
ca .bashrc
cc -m "Add bashrc"
cpv
```
