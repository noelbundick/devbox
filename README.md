# devbox

Welcome to Noel's devbox repo! 

You should definitely not use this as-is. You **probably** should only use this to learn & steal interesting bits from (it's MIT licensed - steal away!).

It sets up dev tools that I like & sets colors to Solarized Dark

## Usage

I use Ansible on Linux/WSL/Mac to keep things how I want them

Start here:

```shell
curl https://raw.githubusercontent.com/noelbundick/devbox/master/ansible/init.sh | bash
```

If/when you make some updates or pull latest:

```shell
ansible-playbook -K ~/.devbox/ansible/devbox.yml
```

## Layout

* `/ansible`: The bulk of setup steps, as a convoluted mess of handmade Ansible roles
* `/chromeos`: SSH colors for my Chromebook
* `/dotfiles`: Configuration for various apps for all platforms (should some of these go in os-specific folders? probably!)
* `/macos`: Mac things
* `/windows`: Windows things
* `/wsl`: Some ill-advised disabling of Windows Defender and other WSL config
