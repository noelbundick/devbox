# devbox

Welcome to Noel's devbox repo! I use this repo to set up new development environments, and to keep them up to date as I discover new ways that I like to work. 

Some of this is cobbled together, but I try to keep parts of it reasonably tidy so I can remember how to do things, and so that others can learn from my (mis)adventures

## Linux

All Linux-specific configuration (including Windows Subsystem for Linux) can be found under the `/linux` folder

Install via `init.sh`, then keep in sync via `devbox-update` (found in `.zsh-custom/aliases.zsh`)!

Use `devbox-update-dev` to skip keeping the repo in sync to test things out locally

### init.sh

This is a setup script so I can pipe curl to bash to install everything in one shot. It's Debian/Ubuntu specific and just installs Ansible, then runs `ansible-playbook` on the main playbook

### .zsh-custom

I'm currently running Zsh + oh-my-zsh, and this folder contains all of my aliases, shortcuts, and various other things I like to have in my shell

### WSL

I have some specific quirks for WSL in `.zsh-custom/wsl.zsh` and `devenv-playbook-wsl`

## Windows

Pretty manual at the moment, but it lists some tools/links I like

### Docker + WSL

There's a specific non-intuitive step to set up communication for Docker from WSL, inspired heavily by [the official blog](https://blogs.technet.microsoft.com/virtualization/2017/12/08/wsl-interoperability-with-docker/)

My WSL Ansible playbook `/linux/devenv-playbook-wsl.yml` will take care of the Linux setup & permissions, but you'll need to do a one-time build of `npiperelay` and place it into `C:\tools`. The README.md in `/windows` has the details


## Terminals

I like Solarized Dark, so the `terminals` folder has some info on customizing Chrome Secure Shell and the Windows Console

