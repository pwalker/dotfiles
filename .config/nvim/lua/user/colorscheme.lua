vim.cmd [[
try
  colorscheme nightfly
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
