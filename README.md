# Dockerize Posting

The [Posting](https://github.com/darrenburns/posting) TUI setup to be run locally with Docker (so you don't need `python` or `uv` installed)

## Requirements

1. GitHub public repository read-only PAT (here are the steps if you don't have one already)

   1. In GitHub under settings > developer settings > personal access tokens > fine-grained tokens
   2. Generate a new token
   3. Set a name (something like `ghcr-public-read-only`)
   4. Keep your user as the resource owner
   5. Set an expiration (because this token won't have any write access, it's probably okay to set it to not expire)
   6. Keep the repository access as "Public Repositories (read-only)"
   7. You don't need to add any other permissions
   8. Generate the token and store it securely for your records

2. [Docker](https://docs.docker.com/get-started/get-docker/)

## Setup

1. Clone this repo somewhere your user has access. I prefer my home directory: `~`

```shell
git clone git@github.com:noahjahn/posting.git ~/posting
```

2. Add the directory to your users' PATH

3. Login to the GitHub container registry

```shell
docker login ghcr.io
```

Username: `<your-github-username>`

Password: `<your-github-pat>`

_your PAT should be kept private, don't share it with anyone_

4. Add the directory to your users' `PATH`

- The file is different depending on your OS. Examples:

  - .bash_profile
  - .bashrc
  - .profile
  - .zshrc
  - .zprofile

- be sure to change the file path if you didn't clone this repo to your home directory

```bash
if [ -d "$HOME/posting/bin" ] ; then
    PATH="$PATH:$HOME/posting/bin"
fi
```

## Usage

```shell
posting help
```

```
Usage:  posting [OPTIONS] [COMMANDS]

Run Posting TUI

Options:
  -d, --data-dir        string  The path to the data directory. Used to preserve data

Commands:
  help          Display usage and how to use the script
```

The data directory option defaults to "$HOME/.posting/data".

So, you can just run `posting` to start the app.
