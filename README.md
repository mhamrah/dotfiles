# Dotfiles: ZSH, Starship, Workflows, and Dev Tooling

This repo contains my terminal and tooling setup focused on:
- Fast, readable prompt (Starship) with vi-mode indicators, GCP project, and Kubernetes context.
- Ergonomic Zsh config (vi bindings, great completions, fzf, alias-tips).
- Per-project runtime management (mise) and optional env injection (direnv).
- Useful defaults for Docker/Compose, Kubernetes, Go, Rust, Node/TS, and more.
- Managed with stow (symlinks), so you can opt-in per module.

Use this README to get productive quickly and learn the key workflows and bindings.


## Quick start

1) Install Homebrew formulae and tooling
- From the repo root:

      ./homebrew.sh

- This installs core tools (starship, zoxide, eza, bat, ripgrep, fd, fzf, neovim, docker, kubernetes-cli, kubectx, google-cloud-sdk, wrangler, mise, direnv, pnpm, uv, etc.), sets up fzf bindings, and keeps everything consistent.

2) Clone and stow dotfiles
- Clone this repo to `~/dotfiles`:

      git clone https://github.com/mhamrah/dotfiles.git ~/dotfiles

- Stow specific modules (recommended):

      cd ~/dotfiles
      stow -t ~ zsh starship zed nvim git ghostty ssh gpg

  This links files directly into `~` (e.g., `zsh/.zshrc` -> `~/.zshrc`,
  `starship/.config/starship/starship.toml` -> `~/.config/starship/starship.toml`).

- Optionally stow all top-level packages:

      stow -t ~ */

  Note: Do not use `stow -t ~ .` (passing `.` as the package). That will
  symlink entire directories like `~/zsh` instead of placing files at their
  correct locations (you’d see `~/zsh/.zshrc` instead of `~/.zshrc`). If you
  did this by accident, undo it with:

      stow -t ~ -D .

3) Restart the shell
- Open a new terminal or source your shell:

      exec zsh

4) Optional: enable direnv for a project
- In a project directory:

      echo 'use mise' > .envrc
      direnv allow

This auto-activates the tool versions from .mise.toml and any environment that direnv manages.


## Terminal and prompt

- Shell: Zsh with vi-mode and smart completions
- Prompt: Starship
  - Vi mode indicators:
    - Insert: ❯ (green)
    - Normal: ❮ (yellow)
    - Replace: ❮ (purple)
    - Visual: ❮ (blue)
  - GCP project shown (gcloud module)
  - Kubernetes context/namespace shown (kubernetes module)
- Ghostty nicety (OSC 7): The shell publishes the current directory to the terminal on cd and at startup, allowing smarter file dialogs and behavior.

Tip: Starship’s config lives in this repo and is symlinked into ~/.config/starship via stow. Edit dotfiles/starship/.config/starship/starship.toml to customize modules, icons, or styles.


## Zsh key bindings and navigation

- Modes:
  - `bindkey -v` puts the shell in vi mode.
  - Press Esc to switch to normal mode, i for insert.
- History substring search:
  - Up/Down arrows search history by the current prefix.
  - In normal mode: `j` goes forward, `k` goes backward (history substring search).
- Useful movement:
  - Ctrl+Right: forward-word
  - Ctrl+Left: backward-word
  - Delete: delete-char
  - Alt+Backspace: backward-kill-word
- Edit current command in $EDITOR:
  - Ctrl+X Ctrl+E (opens the current command in vim; save and close to run).
- Safety and feedback:
  - Commands that take >2s display a timing summary after completion.
  - Terminal flow control disabled (prevents “frozen” terminal from Ctrl+S).
  - Safer redirection and pipes enabled (noclobber, pipefail).


## Completions and discovery

- Completions are fast and rich (zsh-completions, fzf-tab).
- **Alias discovery:**
  - Automatic hints: typing real commands will suggest shorter aliases (alias-tips plugin)
  - Manual lookup helpers:
    - `ghelp`: list all git aliases
    - `dhelp`: list all docker aliases
    - `khelp`: list all kubectl aliases
    - `ahelp <keyword>`: search aliases by keyword (e.g., `ahelp commit`)
- Completion cache auto-refreshes hourly, keeping completions responsive without reinitializing every shell.
- Homebrew completions are loaded from brew's site-functions path.


## fzf workflows

- Fuzzy find everything:
  - Ctrl+T: open file chooser (uses `fd` if available, fallback to `rg`).
  - Completions enhanced with fzf-tab (press Tab twice for menus).
  - Previews with `bat` (syntax highlighted) when available.
- Helpers:
  - `fe`: fuzzy-edit one or more files in `$EDITOR` (vim/neovim).
  - `fcd`: fuzzy-cd into a directory (scans tree, excludes dot-directories).


## Faster navigation with zoxide

- `z <keyword>`: jump to a recently/frequently used directory.
- `zi`: interactive selection of recent directories.
- `zz`: jump to previous directory.


## mise (universal version manager)

- Auto-activates in directories with `.mise.toml` (via `mise activate zsh`).
- Manages your runtimes and CLIs (Node, pnpm, Go, Rust, etc.).
- Typical flows:
  - Global tools:

        mise use -g node@lts pnpm@latest go@latest rust@latest

  - Per-project tools:

        # In project:
        mise use node@22 pnpm@latest
        mise install

  - See current active tools:

        mise current

- Combine with direnv:
  - Create `.envrc`:

        use mise

  - Approve once per project:

        direnv allow

- Python:
  - If you use Python, `uv` (installed via Homebrew) is recommended for dependency and venv management; you can optionally let mise track uv as a tool, but don’t let both manage the same Python interpreter version.



## Git

Using Oh My Zsh git plugin for comprehensive alias coverage (200+ aliases).

**Discovery helpers:**
- `ghelp`: list all git aliases
- `ahelp git`: search aliases by keyword

**Top Git aliases:**

**Status & Info:**
- `gst`: git status
- `gd` / `gds`: git diff / git diff --staged
- `glog`: git log with nice formatting
- `gsh`: git show

**Add & Commit:**
- `ga` / `gaa`: git add / git add --all
- `gapa`: git add --patch (interactive)
- `gcmsg`: git commit -m
- `gcam`: git commit -a -m
- `gca`: git commit --amend
- `gcn!`: git commit --amend --no-edit

**Branch & Checkout:**
- `gco` / `gcb`: git checkout / checkout -b
- `gcm`: git checkout main (smart: detects main/master/trunk)
- `gcd`: git checkout develop (smart: detects dev/devel/develop)
- `gb` / `gba`: git branch / branch --all
- `gbd` / `gbD`: git branch -d / -D (delete)
- `gsw` / `gswc`: git switch / switch -c

**Fetch, Pull, Push:**
- `gf` / `gfa`: git fetch / fetch --all --prune
- `gl` / `gup`: git pull / git pull --rebase
- `gp` / `gpf`: git push / push --force-with-lease
- `ggpush` / `ggpull`: push/pull to current branch

**Merge & Rebase:**
- `gm` / `gma`: git merge / merge --abort
- `grb` / `grbi`: git rebase / rebase -i
- `grba` / `grbc`: rebase --abort / --continue

**Stash:**
- `gsta` / `gstp`: git stash / stash pop
- `gstl`: git stash list
- `gstd`: git stash drop

**Reset & Clean:**
- `grhh`: git reset --hard HEAD
- `grh`: git reset HEAD
- `gclean`: git clean -id (interactive)

**Other:**
- `gcp` / `gcpa` / `gcpc`: cherry-pick / abort / continue
- `grt`: cd to git root directory
- `gwip`: git add all + commit with --wip-- message (work in progress)

## Docker and Docker Compose

Using Oh My Zsh docker and docker-compose plugins for comprehensive alias coverage.

**Discovery helpers:**
- `dhelp`: list all docker aliases
- `ahelp docker`: search aliases by keyword

**Top Docker aliases:**
- `dps` / `dpsa`: docker ps / docker ps -a
- `dil` / `dils`: docker image ls
- `dlo`: docker container logs
- `dxc` / `dxcit`: docker exec / docker exec -it
- `dr` / `drit`: docker run / docker run -it
- `drm` / `drm!`: docker rm / docker rm -f
- `dst` / `dstp`: docker start / docker stop
- `dsta`: docker stop all running containers
- `dil`: docker image ls
- `dirm`: docker image rm
- `dipru`: docker image prune -a
- `dnls`: docker network ls
- `dvls`: docker volume ls
- `dpsf`: custom formatted docker ps (preserved from old config)

**Top Docker Compose aliases:**
- `dco`: docker compose
- `dcup` / `dcupd`: docker compose up / up -d
- `dcupb` / `dcupdb`: up --build / up -d --build
- `dcdn`: docker compose down
- `dcb`: docker compose build
- `dce`: docker compose exec
- `dcr`: docker compose run
- `dcl` / `dclf`: docker compose logs / logs -f
- `dcps`: docker compose ps
- `dcrestart`: docker compose restart
- `dcpull`: docker compose pull

Completions for docker and compose are auto-configured by the plugins.


## Kubernetes (kubectl, kubectx, kubens)

Using Oh My Zsh kubectl plugin for comprehensive alias coverage (100+ aliases).

**Discovery helpers:**
- `khelp`: list all kubectl aliases
- `ahelp kubectl`: search aliases by keyword

**Top kubectl aliases:**
- `k`: kubectl
- `kgp` / `kgpa` / `kgpwide`: get pods / all namespaces / wide output
- `kgs` / `kgsa` / `kgswide`: get services / all namespaces / wide output
- `kgd` / `kgda`: get deployments / all namespaces
- `kga` / `kgaa`: get all / all namespaces
- `kdp` / `kds` / `kdd`: describe pod/service/deployment
- `kl` / `klf`: logs / logs -f
- `kl1h` / `kl1m`: logs from last 1h / 1m
- `kaf`: kubectl apply -f
- `kdel` / `kdelf`: delete / delete -f
- `keti`: exec -t -i (interactive shell)
- `kcuc`: kubectl config use-context
- `kcsc` / `kcdc`: config set-context / delete-context
- `kcgc`: config get-contexts
- `kcn`: set current namespace
- `kgns`: get namespaces
- `kgcm` / `kgsec`: get configmaps / secrets
- `kpf`: port-forward
- `kcp`: kubectl cp (copy files)

**Context and namespace switching:**
- If kubectx/kubens installed (recommended via Homebrew):
  - `kctx`: switch context (uses fast Go version)
  - `kns`: change namespace (uses fast Go version)
- Otherwise uses kubectl config commands

**Starship integration:**
- Shows current context and namespace inline in the prompt

**Tip:** For GKE, your gcloud auth and contexts are visible via `kubectl config get-contexts` and switchable via `kctx`.


## Cloud CLIs (GCP and Cloudflare)

- gcloud:
  - Path and completions are sourced if installed via Homebrew.
  - Starship displays the active GCP project inline.
- wrangler:
  - Completions are auto-enabled if the CLI supports generation.


## Editors and AI

- Editors:
  - `z.` opens current directory in Zed.
  - `c.` opens current directory in Cursor.
- AI helper:
  - `ai "your prompt"` uses `ollama` if installed (model default: `llama3`).
  - Set `AI_MODEL` to choose a different model.


## File and text tools

- `ls` is replaced by `eza` with icons and git info (ll/la/tree/lt variants).
- `cat` is replaced by `bat` (syntax highlighting).
- `grep` is replaced by `ripgrep` (`rg`) when available.
- `procs` provides a modern `ps` experience.


## Performance and maintenance

- zinit:
  - Plugins lazy-load (wait) and shallow-clone for fast startup.
  - Autoupdates weekly.
- Completion init:
  - Uses cached dump, refreshes hourly via a periodic hook.
- fzf:
  - Homebrew post-install enables shell key bindings and completions.
- Starship:
  - Config in this repo; stow keeps it synced.

If startup regresses, check your `.zshrc` recent edits, temporarily disable new plugins, and measure with `zsh -x` or timing hooks.


## Troubleshooting

- Completions not showing:
  - Open a new shell to let the cache refresh, or run `compinit` manually.
  - Verify brew site-functions in FPATH: `echo $fpath`.
- Aliases not working:
  - Some aliases load only if tools are installed (e.g., eza, bat, rg).
- Starship config not applying:
  - Ensure `stow starship` created `~/.config/starship/starship.toml` symlink.
  - Restart shell.
- direnv not activating:
  - Run `direnv allow` once per project after creating `.envrc`.
- mise not activating:
  - Confirm `mise activate zsh` runs (present in `.zshrc`), or run `mise doctor`.
- Docker/Compose permissions:
  - Ensure Docker Desktop is running and the CLI is configured.


## Suggested first steps to master the setup

- Vi-mode: Practice normal mode navigation and `Ctrl+X Ctrl+E`.
- fzf muscle memory: Use Ctrl+T and `fe` frequently.
- zoxide: Use `z <dir-fragment>` to jump instead of `cd`.
- mise + direnv: Create `.mise.toml` and `.envrc` in a project and feel the auto-activation.
- Docker/K8s: Try `dps`, `dcu`, `k`, `kctx`, `kns`, and observe Starship’s context display.


## Zsh power user tips

- History search (fastest ways)
  - Ctrl+R: fuzzy-search history with fzf (press Enter to run, Tab to select, Ctrl+Y to paste).
  - Up/Down: history substring search for the current prefix (type part of a command, then use arrows).
  - history: list recent commands (use history 50 for the last 50).
  - fc: open the last command in $EDITOR; fc -s 'old=new' reruns last command with substitution.

- History expansion (bang “!” tricks)
  - !!: rerun last command
  - !$: last argument of previous command (great with sudo: sudo !! or vim !$)
  - !^: first argument of previous command
  - !?str?: last command containing “str”
  - ^old^new: rerun previous command with first occurrence replaced
  - !-2: command 2 back; !123: command number 123 from history
  - Word designators: !!:1 (first arg), !!:$ (last arg), !!:* (all args)

- Word and line navigation/editing
  - Ctrl+Left / Ctrl+Right: move by word
  - Alt+Backspace: delete previous word
  - Ctrl+A / Ctrl+E: start/end of line
  - Ctrl+U / Ctrl+K: delete to start/end of line
  - Ctrl+W: delete previous word (shell-aware)
  - Vi mode (Esc to normal mode):
    - w / b / e: forward/back/forward-to-end word motions
    - 0 / ^ / $: start/first-nonblank/end of line
    - db / dw / de / d$: delete by motions; cw / ce to change by motions
    - u / Ctrl+R: undo/redo in zle

- Directory stack and quick jumps
  - cd -: go to previous directory; cd -2, cd -3: go back further in the stack
  - dirs -v: show indexed directory stack; pushd/popd to manage it
  - zoxide:
    - z proj: jump to frequently used “proj”
    - zi: interactive jump; zz: previous directory

- Globbing and completion power
  - Extended globbing enabled (setopt extended_glob):
    - ls **/*.ts: recursive glob
    - rm *.log(.): files only; add N to ignore non-matching (e.g., *.doesnotexist(N))
  - fzf-tab: press Tab twice to open interactive completion menus; use , and . to switch groups
  - Case-insensitive completion and matcher-lists are configured; type loosely, Tab to complete

- Sudo and reruns
  - sudo !!: rerun the previous command with sudo
  - fc -s: interactively fix-and-rerun last command (e.g., fc -s vim=nvim)

- Editing the current command
  - Ctrl+X Ctrl+E: open the current command in $EDITOR (vim), save & quit to run

- Handy built-ins
  - which -a cmd: see all matches for a command on PATH
  - type cmd: see if a name is an alias, function, builtin, or file
  - print -s 'cmd': append a command to history without running it

- Performance notes
  - Completion cache refreshes hourly in the background
  - fzf key bindings and previews are pre-configured (fd + bat if installed)
  - Plugins are lazy-loaded via zinit for snappy startup

## Contributing / Customization

- Fork and tweak:
  - Zsh: dotfiles/zsh/.zshrc
  - Starship: dotfiles/starship/.config/starship/starship.toml
  - Homebrew: dotfiles/homebrew.sh
- Stow your modules as needed, and keep everything in-source so a new machine is a `stow` + `./homebrew.sh` away.

Happy hacking!
