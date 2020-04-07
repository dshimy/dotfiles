# Darian's Dotfiles

This repository is used for my configuration files. And yes, I use this to synchronize files between my computers and servers.  It works pretty well.  This is really just for me, but if you are interested, here you go.

## Getting Started

First, install dependencies:

```sh
brew install stow
brew install rbenv
npm install -g spaceship-prompt
```

Install a powerline font and use it in your terminal:

- https://github.com/powerline/fonts

Then checkout the `dotfiles` repo and run the install script:

```sh
git checkout git@github.com:dshimy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install.sh
```

## Terminal Colors

Customize the terminal with some colors.

- https://github.com/arcticicestudio/nord-iterm2
- https://github.com/arcticicestudio/nord-terminal-app

## Post Installation Tasks

- https://cloud.google.com/sdk/docs/downloads-interactive

## MIT License

Copyright 2020 Darian Shimy

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
