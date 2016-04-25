if exists("current_compiler")
  finish
endif
let current_compiler = "xmllint"
setlocal makeprg=xmllint\ --schema\ ~/interprete/ModeloLogico.xsd\ --noout\ %
setlocal errorformat=%f:%l:\ %m
