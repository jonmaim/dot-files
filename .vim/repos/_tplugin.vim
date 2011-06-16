" This file was generated by TPluginScan.
if g:tplugin_autoload == 2 && g:loaded_tplugin != 11 | throw "TPluginScan:Outdated" | endif
TPluginBefore \<tcomment_vim[\/]autoload[\/] TPlugin tcomment_vim
call TPluginAutoload('tcomment', ['tcomment_vim', '.'])
call TPluginAutoload('tplugin#autoload#fugitive', ['tplugin_vim', '.'])
call TPluginAutoload('tplugin#autoload#fuzzyfinder', ['tplugin_vim', '.'])
call TPluginAutoload('tplugin#autoload#supertab', ['tplugin_vim', '.'])
call TPluginAutoload('tplugin#autoload#vcscommand', ['tplugin_vim', '.'])
call TPluginAutoload('tplugin#vcsdo', ['tplugin_vim', '.'])
call TPluginAutoload('tplugin', ['tplugin_vim', '.'])
call TPluginRegisterRepo('tcomment_vim')
call TPluginRegisterPlugin('tcomment_vim', 'tcomment')
call TPluginCommand('command! -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TComment', 'tcomment_vim', 'tcomment')
call TPluginCommand('command! -bang -complete=customlist,tcomment#Complete -range -nargs=+ TCommentAs', 'tcomment_vim', 'tcomment')
call TPluginCommand('command! -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentRight', 'tcomment_vim', 'tcomment')
call TPluginCommand('command! -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentBlock', 'tcomment_vim', 'tcomment')
call TPluginCommand('command! -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentInline', 'tcomment_vim', 'tcomment')
call TPluginCommand('command! -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentMaybeInline', 'tcomment_vim', 'tcomment')