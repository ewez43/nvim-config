# Plugin installation

```bash
sudo apt-get install clangd
gem install ruby-lsp
sudo npm install -g typescript-language-server typescript
sudo apt-get install python3-pylsp
go install golang.org/x/tools/gopls@latest
sudo npm install -g @fsouza/prettierd
gem install rubocop
npm install -g eslint_d
```

# Creating local.lua

Sometimes the config needs to know the paths to some things in your filesystems. These cases are handled by the local.lua file in lua/configs. To create this file simply rename local.lua.example to local.lua and substitute the example paths with your own.

```bash
mv ~/.config/nvim/lua/configs/local.lua.example ~/.config/nvim/lua/configs/local.lua
```

------------------------------------------------------------------------------------

**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
