" ___vital___
" NOTE: lines between '" ___vital___' is generated by :Vitalize.
" Do not mofidify the code nor insert new lines before '" ___vital___'
if v:version > 703 || v:version == 703 && has('patch1170')
  function! vital#_incsearch#Over#Commandline#Modules#ExceptionMessage#import() abort
    return map({'make': ''},  'function("s:" . v:key)')
  endfunction
else
  function! s:_SID() abort
    return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
  endfunction
  execute join(['function! vital#_incsearch#Over#Commandline#Modules#ExceptionMessage#import() abort', printf("return map({'make': ''}, \"function('<SNR>%s_' . v:key)\")", s:_SID()), 'endfunction'], "\n")
  delfunction s:_SID
endif
" ___vital___
scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim


let s:vname = expand("<sfile>:h:h:h:h:t")


let s:module = {
\	"name" : "ExceptionMessage",
\}


function! s:module.on_exception(cmdline)
	let self.exception  = v:exception
	let self.throwpoint = v:throwpoint
endfunction


function! s:module.on_draw_pre(cmdline)
	if has_key(self, "exception")
		call self.message(a:cmdline)
		unlet self.exception
	endif
endfunction

function! s:module.message(...)
	echohl ErrorMsg
	execute self.command string(self.prefix . " : " . self.throwpoint . " " . self.exception)
	echohl None
endfunction


function! s:module.on_leave(cmdline)
	if has_key(self, "exception")
		call self.message(a:cmdline)
		unlet self.exception
	endif
endfunction


function! s:make(...)
	let result = deepcopy(s:module)
	let result.prefix = get(a:, 1, "vital-over(".s:vname.") Exception")
	let result.command = get(a:, 2, "echom")
	return result
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
