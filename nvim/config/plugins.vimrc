"██╗   ██╗██╗███╗   ███╗      ██████╗ ██╗     ██╗   ██╗ ██████╗
"██║   ██║██║████╗ ████║      ██╔══██╗██║     ██║   ██║██╔════╝
"██║   ██║██║██╔████╔██║█████╗██████╔╝██║     ██║   ██║██║  ███╗
"╚██╗ ██╔╝██║██║╚██╔╝██║╚════╝██╔═══╝ ██║     ██║   ██║██║   ██║
" ╚████╔╝ ██║██║ ╚═╝ ██║      ██║     ███████╗╚██████╔╝╚██████╔╝
"  ╚═══╝  ╚═╝╚═╝     ╚═╝      ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝

call plug#begin('~/.config/nvim/plugged')

"Colorschemes
Plug 'morhetz/gruvbox'

"Status and Tab line and themes for it
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Hexadecimal display
Plug 'chrisbra/Colorizer'

"To surround anything with simplicity
Plug 'tpope/vim-surround'

"For editing and compiling Tex file
Plug 'lervag/vimtex'

"To work with all REPL
Plug 'jpalardy/vim-slime'

"Markdown
Plug 'plasticboy/vim-markdown'

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"repeat.vim
Plug 'tpope/vim-repeat'

"Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"pear-tree
Plug 'tmsvg/pear-tree'

"PlantUML preview
Plug 'weirongxu/plantuml-previewer.vim'

call plug#end()
