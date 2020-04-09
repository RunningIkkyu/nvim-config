## 安装

### 安装 `neovim`

本文只写 `Linux` 的安装。

由于仓库的 `neovim` 版本可能和最新版本有很大的差异，所以我选择手动下载安装。进入到 neovim 官网的 [`release`](https://github.com/neovim/neovim/releases) 页面。然后下载你需要的版本。这里以 `NVIM 0.4.3` 为例。


1. 下载 `nvim.appimage`

2. 加入可执行权限：

```bash
chmod u+x nvim.appimage
```

3. 放入 `/usr/bin` 目录

```bash
sudo mv nvim.appimage /usr/bin/nvim
```

然后 `nvim` 就可以运行了。


## 配置

顺便说一下，`neovim` 的配置文件位置： `~/.config/nvim/init.vim`

### 插件管理

这里我们默认使用 [`vim-plug`](https://github.com/junegunn/vim-plug)做插件管理，如果不了解，可以去官方网站了解下。安装 `vim-plug` 其实就是把文件下载下来保存为 `~/.vim/autoload/plug.vim`，在终端执行：

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

上面的链接国内可能访问不了，没有梯子的同学可以运行下面这句：
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://gitee.com/c4pr1c3/vim-plug/raw/master/plug.vim
```
### 自动补全

**1. 安装 `coc.vim`**

`coc.vim` 是一个为 `Neovim`/`vim8` 制作的智能提示引擎。了解更多可以查看官方[维基](https://github.com/neoclide/coc.nvim/wiki)。

`coc.vim` 依赖于 `node`，所以我们要先安装 `node`:

```
sudo apt install node
```
安装 `coc.vim` 和安装其他插件一样简单，在 neovim 配置`~/.config/nvim/init.vim`中加入

```
Plug 'neoclide/coc.nvim', {'branch': 'release'}
```


然后新开一个 `nvim`，运行

```
:PlugInstall
```

等待安装完成，重启 `vim`。

**2. 安装 `Python` 支持**

接下来安装语言支持：

```
:CocInstall coc-python
```

**3. 安装快速生成代码插件**

```
:CocInstall coc-snippets
```

![](https://user-gold-cdn.xitu.io/2020/4/8/1715a7b68f68daff?w=708&h=230&f=gif&s=46061)


**3. 安装书签**　

官方教程查看 [`coc-bookmark`](https://github.com/voldikss/coc-bookmark#coc-bookmark)

```
:CocInstall coc-bookmark
```

### 搜索

依赖于[`ripgrep`](https://github.com/BurntSushi/ripgrep#installation)

先安装，去官方 [release](https://github.com/BurntSushi/ripgrep/releases
) 页面下载 `deb` 包，接着解压就行了：

```bash
sudo dpkg -i ripgrep_11.0.2_amd64.deb
```

需要搜索时，在文本中执行：

```vim
:CocSearch -w [单词]
```


### 配色插件

这里我们的配色方案使用[`gruvbox`](https://github.com/morhetz/gruvbox)插件，不多说，直接上效果图：


![](https://user-gold-cdn.xitu.io/2020/4/8/1715a65544c4ac2e?w=1920&h=1080&f=png&s=113468)


vim 配置：

```vim
Plug 'morhetz/gruvbox'

colorshceme gruvbox     "启用 gruvbox 配色方案
```

### 窗口控制

- `<ctrl-L>` 切换到右侧窗口
- `<ctrl-H>`切换到左侧窗口
- `<ctrl-J>`切换到下方窗口
- `<ctrl-K>`切换到上方窗口
- `<ctrl-/>`切换到刚刚的窗口

配置文件中写入：

```
Plug 'christoomey/vim-tmux-navigator'
```

然后 `:PlugInstall` 安装。


### 文件浏览

使用老牌的 [`NERDTree`](https://github.com/preservim/nerdtree)

```
Plug 'preservim/nerdtree'
```

配置

```vim
" NERDTree settings            
                             
" open a NERDTree automatically when vim starts up if no files were specified    
autocmd StdinReadPre * let s:std_in=1    
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif    
                             
" open NERDTree automatically when vim starts up on opening a directory    
autocmd StdinReadPre * let s:std_in=1    
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Let NERDTree igonre files
let NERDTreeIgnore = ['\.pyc$', '\.swp$']
  
```


### 美化状态栏

状态栏使用插件 [`vim-airline`](https://github.com/vim-airline/vim-airline)，该插件可以对接 `coc.vim`。
```vim
Plug 'vim-airline/vim-airline'
let g:airline_theme='badwolf'  "可以自定义主题，这里使用 badwolf
```

效果图(可以程序有错误的时候右下角有错误数量提示 `E:1`)：

![`vim-airline` 效果图](https://user-gold-cdn.xitu.io/2020/4/9/1715d714acc38b39?w=1920&h=1080&f=png&s=147185)




### 加入 emoji 图标

使用插件 [`vim-devicons`](https://github.com/ryanoasis/vim-devicons)

安装可以参考 [教程](https://github.com/ryanoasis/vim-devicons/wiki/Installation)

```
Plug 'ryanoasis/vim-devicons'
```

安装完需要安装 `nerd` 字体，这些字体是加入了图标之后的补丁字体，安装完字体之后才能正常显示图标。去 [字体下载列表](https://www.nerdfonts.com/font-downloads) 中选择你喜欢的字体安装。完成之后的界面大概这样：


![](https://user-gold-cdn.xitu.io/2020/4/9/1715e0187d86b08e?w=1920&h=1080&f=png&s=215889)



### 注释插件

[`nerdcommenter`](https://github.com/preservim/nerdcommenter)

```vim
Plug 'preservim/nerdcommenter' 
```

配置：
使用 `<ctrl-/>` 来注释、反注释代码。

```vim
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
```

### 自动生成 Python 函数/类文档

[`vim-doge`](https://github.com/kkoomen/vim-doge)

```vim
Plug 'kkoomen/vim-doge'
```

配置：

```vim
"let g:doge_doc_standard_python = 'numpy'
"let g:doge_doc_standard_python = 'google'
let g:doge_doc_standard_python = 'reST'
```

### 快速对齐

[`vim-easy-align`](https://github.com/junegunn/vim-easy-align)

```vim
Plug 'junegunn/vim-easy-align'
```

![](https://user-gold-cdn.xitu.io/2020/4/9/1715e266a5cf9141?w=710&h=275&f=gif&s=664657)


### 彩虹括号

[`vim-rainbow`](https://github.com/frazrepo/vim-rainbow)

```vim
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 
```
