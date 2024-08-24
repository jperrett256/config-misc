# config-misc

This is a place for me to put configuration-related files, particularly ones that don't deserve their own repository.

## List

### Sublime Merge + Nvim interop

Sublime Merge lets you configure the editor you use, and the argument format for passing the file, line and column info. However, they don't allow quotes, for some reason, which makes it difficult to get working with Neovim. So wrote a script called `smerge_nvim_goto.bat`, which takes the file, line and column as separate arguments, and sends a command to Neovim (expects the config shown in nvim-config).

TODO not sure how well it works for file paths containing e.g. spaces, Sublime Merge may well handle this, but may not. (Need to test.)

This can be configured as the "editor" in Sublime Merge, with the argument format set to "${file} ${line} ${col}". Note the Neovim server needs to be running, but the Neovim server has a `:ServerStart` custom command to make this process easy (and `:ServerStop`, for when you want to start the server in another Neovim instance). These Neovim commands use the address stored in `NVIM_SERVER_ADDRESS`, which you will probably want set to something like `127.0.0.1:<port>` (where `<port>` is some port of your choice).