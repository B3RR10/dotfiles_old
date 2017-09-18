#!/usr/local/bin/rustscript

#[macro_use]
extern crate shells;

use std::process;
use std::fmt;

fn checkResult<'a>(code: i32, stdout: &'a str, _stderr: &'a str) {
    match code {
        0 => {
            println!("Install vim-plug");
        }
        _ => {
            println!("vim-plug couldn't be installed.\n{}", _stderr);
            // process::exit(1);
        }
    }
}

// Get the actual path
let (_, currentDir, _) = zsh!("pwd");
println!("{}", currentDir);

// Download the vim-plug file
let (code, stdout, _stderr) = zsh!("curl -fLo ./vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim");
checkResult(code, &stdout, &_stderr);

// Make symlink from vimrc
let (code, stdout, _stderr) = zsh!("ln -s $HOME/new-dotfiles/vimrc $HOME/.vimrc");
checkResult(code, &stdout, &_stderr);

// Make symlink from vim folder
let (code, stdout, _stderr) = zsh!("ln -s $HOME/new-dotfiles/vim $HOME/.vim");
checkResult(code, &stdout, &_stderr);

// vim: filetype=rust
