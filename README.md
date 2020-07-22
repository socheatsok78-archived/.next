# .next
The next version of .dotfile repository

### :warning: Use at your own risk
You should only use this on a **fresh installed system!**
This is a personal `dotfile` environment, I intend to use on ***my own system***, but if you insist to use the same environment as I do, please know that you're on your own.

But if you enjoy it please give it a :star:!

[![Build Status](https://travis-ci.com/socheatsok78/.next.svg?branch=master)](https://travis-ci.com/socheatsok78/.next)

## Installation
To automatically install dotfile on your system, simply run the following command:
```sh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/socheatsok78/.next/master/install.sh)"
```

After the installation completed, add the following line to your .bashrc or .zshrc file in your $HOME directory:
```sh
# socheatsok78/dotfile
test -e "$HOME/.zsh_profile" && source "$HOME/.zsh_profile"
```

## Configurations

#### `.zshrc`

```sh
ZSH_THEME="robbyrussell"

plugins=(ssh-agent git last-working-dir)
```

**Changing ASCII profile art**

By default the ascii art is set to my personal one. But you could change to to your preferences.

Simply create a new function eg. `andrew` that will print out the ASCII art and set the `ZSH_ASCII_PROFILE` variable to equal that function name and add it to the line before `source` operation.

```sh

function andrew() {
    echo -e "     _              _                   "
    echo -e "    / \   _ __   __| |_ __ _____      __"
    echo -e "   / _ \ | '_ \ / _\` | '__/ _ \ \ /\ / /"
    echo -e "  / ___ \| | | | (_| | | |  __/\ V  V / "
    echo -e " /_/   \_\_| |_|\__,_|_|  \___| \_/\_/  "
    echo -e " \n A senior developer is helpful, not all- \n knowing.\n"
}

# ASCII Art
ZSH_ASCII_PROFILE=andrew

# socheatsok78/dotfile
test -e "$HOME/.zsh_profile" && source "$HOME/.zsh_profile"
```

#### Apply Homebrew `brewfile` templates
By default the following template will be automically applied during `dotfile` installation:
- developments
- webserver
- tools

Otherwise please check this folder for more details `lib/homebrew`

```sh
dotfile apply [template]
```

## Update
To get the latest update of dotfile simply run the following command:
```sh
$ dotfile update
```

### See also
There are some great dotfiles around:
- [terkelg/dotfiles](https://github.com/terkelg/dotfiles)
- [MikeMcQuaid/dotfiles](https://github.com/MikeMcQuaid/dotfiles)
- [lifepillar/dotfiles](https://github.com/lifepillar/dotfiles)

## :memo: License
Licensed under the [MIT License](LICENSE).
