vim.cmd([[
set background=dark
if has('gui_running')
    let g:gruvbox_material_background = 'soft'
    let g:gruvbox_material_disable_italic_comment = 1
    colorscheme gruvbox-material
else
    let g:solarized_italics = 0
    colorscheme solarized8
    " set background=light
    " let g:edge_disable_italic_comment=1
    " let g:edge_dim_inactive_windows=1
    " colorscheme edge
endif
]])
