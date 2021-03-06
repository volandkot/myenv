"не совеместимость с vi (для расширенной функциональности)
set nocompatible
"распознование типов файлов
filetype plugin on

"табуляции через 4 пробела
set tabstop=4
set smarttab
set smartindent
set shiftwidth=4
set expandtab

"маппинг символов в нормальном режиме
"set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\;'zxcvbnm\\,.,ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>

"если не работает backspace
set backspace=indent,eol,start

"расширенное меню
set wildmenu
set wcm=<tab>

"настройка статус-бара и таб-бара
set showtabline=2
set laststatus=2

"только текущая ветка
let g:git_branch_status_head_current=1

"с плагином для веток гита ( https://github.com/vim-scripts/Git-Branch-Info )
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ 0x%B\ %l,%c%V\ %P\ %{GitBranchInfoString()}
"без плагина для веток гита
"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ 0x%B\ %l,%c%V\ %P

"язык
language en_US
set iminsert=0
set imsearch=0

"заголовок окна
set title
set titlestring=%t%(\ %m%)%(\ %r%)%(\ %h%)%(\ %w%)%(\ (%{expand(\"%:p:~:h\")})%)\ -\ VIM
"переносы
set wrap
"автоотступы
set ai
set cin

"показывать парную скобку при вводе
set showmatch
"поиск: подстветка, регистр
set hlsearch
set incsearch
set ignorecase

"подсветка синтаксиса
syntax on

"запрашивать подтверждения (запись файлов)
set confirm

"скрытые буферы
set hidden
"нумерация строк
set number

"вкл/выкл режима вставки
set pastetoggle=<F4>
"автосчитываение с диска
set autoread

"размер истории команд, undo
set history=128
set undolevels=1000

"настройки кодировок и форматов файлов
set encoding=utf-8
set termencoding=utf-8
set fileformat=unix
set ffs=unix,dos,mac
set fileencodings=utf-8,cp1251

"меню смены кодировки отображения
menu Encoding.Read.UTF8   :e ++enc=utf8<CR>
menu Encoding.Read.CP1251 :e ++enc=cp1251<CR>
map <silent> <F7> :emenu Encoding.Read.<tab>

"меню смены кодировки файла
menu Encoding.Write.UTF8   :set fenc=utf8<CR>
menu Encoding.Write.CP1251 :set fenc=cp1251<CR>
map <silent> <F8> :emenu Encoding.Write.<tab>

"открыть/закрыть вкладку
imap <C-t> <Esc>:tabnew<CR>
nmap <C-t> :tabnew<CR>
imap <C-e> <Esc>:tabclose<CR>
nmap <C-e> :tabclose<CR>

"навигация по вкладкам
imap <C-o> :tabprevious<CR>
nmap <C-o> <Esc>:tabprevious<CR>
imap <C-p> :tabnext<CR>
nmap <C-p> <Esc>:tabnext<CR>

imap <F1> <Esc>:tabprevious<CR>
nmap <F1> :tabprevious<CR>
imap <F2> <Esc>:tabnext<CR>
nmap <F2> :tabnext<CR>

"вкл/выкл нумерацию строк
map <silent> <F3> :set<Space>nu!<CR>
imap <silent> <F3> <Esc>:set<Space>nu!<CR>a

"свертка перлового кода
let perl_fold = 1
nmap <S-F> za

"табы в режиме выделения сдвигают блок влево-вправо
vmap <TAB> >
vmap <S-TAB> <

"переходы между результатами :grep
nmap <C-n> :cn<CR>
nmap <C-b> :cp<CR>


"проставляем атрубуты на исполнение для файлов с #!.../bin/...
function! ModeChange()
    if getline(1) =~ "^#!"
        if getline(1) =~ "/bin/"
          silent !chmod a+x <afile>
        endif
    endif
endfunction
au! BufWritePost * call ModeChange()

"перечитываем .vimrc после записи
"au! BufWritePost .vimrc source %

"чистим хвостовые проблемы при сохранении
au! BufWritePre * %s/\s\+$//e


"цвета
colorscheme delek
set t_Co=256
set background=dark

"подкращиваем элементы окна
highlight TabLine cterm=none ctermbg=27
highlight TabLineSel cterm=bold,underline ctermbg=4
highlight TabLineFill cterm=none
highlight Folded ctermfg=255 ctermbg=4
highlight StatusLine ctermbg=4
highlight StatusLineNC ctermfg=255 ctermbg=27
highlight Pmenu ctermbg=8
highlight VertSplit cterm=none ctermfg=11 ctermbg=27
highlight FoldColumn cterm=none ctermfg=11 ctermbg=27
highlight Search cterm=bold ctermfg=255 ctermbg=1
highlight MyTagListTagName ctermfg=255 ctermbg=1
highlight MyTagListFileName cterm=bold ctermfg=2 ctermbg=0

