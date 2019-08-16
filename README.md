# dotfiles

Repository to keep my dotfiles up to date.

## Installation

To install the dotfiles in a new system, simply source the `bootstrap.sh` script with the `-b`
parameter.

```sh
./bootstrap.sh -b
```

To see the changes that would be made in the system withouth doing them, use the `-n` flag (dry run)
and the `-d` for extra information (debug).

```sh
./bootstrap.sh -n -d
```

When creating the symlinks, the script creates a backup of a file that already exists in the system.
If you want to avoid this, use the `-f` (force) flag.

```sh
./bootstrap.sh -f
```

All the flags can be used at the same time.

If you have files in your dotfiles directory that should not be linked, add them to the `.dfignore`
file.
