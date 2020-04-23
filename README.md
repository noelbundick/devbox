# devbox

Welcome to Noel's devbox repo! 

You should definitely not use this as-is. You **probably** should only use this to learn & steal interesting bits from (it's MIT licensed - steal away!).

It sets up dev tools that I like & sets colors to Solarized Dark

## Usage

I use Ansible on Linux/WSL (Ubuntu 18.04) to keep things how I want them. 

Requires:

* `curl`
* `git`

Start here:

```shell
# Linux
curl https://raw.githubusercontent.com/noelbundick/devbox/master/ansible/init.sh | bash

# MacOS
curl https://raw.githubusercontent.com/noelbundick/devbox/master/ansible/init.macos.sh | bash
```

If/when you make some updates or pull latest:

```shell
ansible-playbook -K ~/.devbox/ansible/devbox.yml
```

In Visual Studio Online

* Repository: `https://github.com/noelbundick/devbox`
* Target path: `~/.devbox`
* Install command: `vsonline/init.sh`

## Layout

* `/ansible`: The bulk of setup steps, as a convoluted mess of handmade Ansible roles
* `/chromeos`: SSH colors for my Chromebook
* `/dotfiles`: Configuration for various apps for all platforms (should some of these go in os-specific folders? probably!)
* `/keyboard`: Custom keyboard firmware / mappings
* `/macos`: Mac things
* `/vsonline`: Use this repo as Visual Studio Online dotfiles
* `/windows`: Windows things
* `/wsl`: WSL config
