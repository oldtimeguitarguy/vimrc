augroup config
    autocmd!

    " INSTALL PLUGINS WHEN SAVED
    autocmd BufWritePost ~/.vim/plugins.vim silent source $MYVIMRC|call PluginCleanInstallUpdate()|call RefreshDisplay()

    " SOURCE VIMRC WHEN SAVED
    autocmd BufWritePost ~/.vim/vimrc source %|call RefreshDisplay()
    autocmd BufWritePost ~/.vim/config/*.vim source ~/.vim/vimrc|call RefreshDisplay()

    " JUMP TO LAST CURSOR POSITION ON FILE LOAD
    autocmd BufWinEnter * silent! call ResCur()

    " FORCE QUICKFIX TO ALWAYS OPEN FULL WIDTH
    autocmd FileType qf wincmd J

    " TODO(karlhepler): find a way to :mksession after every save
augroup END

augroup bazel
    autocmd!

    " Fix format on save
    autocmd BufWritePost *.bzl,*.bazel,BUILD,WORKSPACE :AsyncRun -post=checktime buildifier %
augroup END

augroup coc_go
    autocmd!

    " Add missing imports on save
    autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
augroup END

augroup images
    autocmd!

    " Open images with imgcat
    autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw
augroup END
