" faust filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.dsp     setfiletype faust
    au! BufRead,BufNewFile *.fst     setfiletype faust
augroup END

" jinja filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.jinja2js   setfiletype htmljinja
    au! BufRead,BufNewFile *.jinja2     setfiletype htmljinja
augroup END
