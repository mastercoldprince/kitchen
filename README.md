# usage
this is a stable version, all the thing is being tested.
make sure you installed neovim>0.8.1   
mv  ~/.config/nvim{,.bak}    
git clone https://github.com/mastercoldprince/kitchen.git ~/.config/nvim    

# 依赖安装
telescope -> ripgrep or alternative live grep picker
lsp-config -> clang pyright...

# tmux插件安装：
1.首先要安装tmux的插件管理器tpm
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
2.然后手动执行tmux配置刷新
```
tmux source-file ~/.tmux.conf
```
3.在安装其他的插件
```
<LeftMouse>Ctrl+b然后 I（Shift+i）
```

