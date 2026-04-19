# dotfiles
My dotfiles that I use across devices.
I took inspiration in [this article](https://www.atlassian.com/git/tutorials/dotfiles) on the Atlassian tutorials page and [this post](https://news.ycombinator.com/item?id=11071754) on Hacker News.

You only need Git to to use this.

## `dotfiles` command and the `.dotfiles` git repository

A git repository `.dotfiles` in my home directory is used to manage the files.
Its work tree is set to the home directory itself.
Untracked files are simply hidden to not cause any noise.

The `dotfiles` command is simply an alias for `git --git-dir=$HOME/.dotfiles --work-tree=$HOME` to make it easy to add or update my dotfiles.
Use it just like `git`:

```bash
dotfiles status
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```

## Install dotfiles on a new system

- [ ] Install git
- [ ] `git clone --bare git@github.com:scheidtdav/dotfiles.git $HOME/.dotfiles`
- [ ] `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
- [ ] `dotfiles checkout`
    - [ ] Fix conflicts by either deleting existing stock dotfiles or backing them up
    - [ ] re-run `dotfiles checkout` if necessary
- [ ] Hide untracked files locally `dotfiles config --local status.showUntrackedFiles no`
