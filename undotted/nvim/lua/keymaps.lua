-- ================================ --
-- Custom KeyMaps --
-- ================================ --
local keymap = function(tbl)
	-- Some sane default options
	local opts = { noremap = true, silent = true }
	-- Dont want these named fields on the options table
	local mode = tbl['mode']
	tbl['mode'] = nil
	local bufnr = tbl['bufnr']
	tbl['bufnr'] = nil

	for k, v in pairs(tbl) do
		if tonumber(k) == nil then
			opts[k] = v
		end
	end


	if bufnr ~= nil then
		vim.api.nvim_buf_set_keymap(bufnr, mode, tbl[1], tbl[2], opts)
	else
		vim.api.nvim_set_keymap(mode, tbl[1], tbl[2], opts)
	end
end

local nmap = function(tbl)
	tbl['mode'] = 'n'
	keymap(tbl)
end

local imap = function(tbl)
	tbl['mode'] = 'i'
	keymap(tbl)
end

local example_func = function(a, b)
      print("A is: ", a)
      print("B is: ", b)
end
-- function fuck()
--    vim.api.nvim_command("Rg")
-- end
-- PLUGIN: FZF
--nnoremap <silent> <Leader>b :Buffers<CR>
--nnoremap <silent> <C-f> :Files<CR>
--nnoremap <silent> <Leader>f :Rg<CR>
--nnoremap <silent> <Leader>/ :BLines<CR>
--nnoremap <silent> <Leader>' :Marks<CR>
--nnoremap <silent> <Leader>g :Commits<CR>
--nnoremap <silent> <Leader>H :Helptags<CR>
--nnoremap <silent> <Leader>hh :History<CR>
--nnoremap <silent> <Leader>h: :History:<CR>
--nnoremap <silent> <Leader>h/ :History/<CR> 

nmap {"<leader>b", ":Buffers<CR>"}
nmap {"gb", ":enew<CR>"}
nmap {"<leader>e", ":e ~/0/dotfiles/undotted/init.lua<CR>"}
nmap {"<c-l>", ":Files<CR>"}
nmap {"<leader>f", ":Rg<CR>"}
-- buffer config
nmap {"gj", ":bprev<CR>"}
nmap {"gk", ":bnext<CR>"}
nmap {"gq", ":bd<CR>"}
-- nmap {}
-- vim.keymap.set('n', 'C-l', "", {silent=true})
-- vim.keymap.set('n', '<C-l>', ":Files<CR>", {silent = true})
vim.keymap.set('n', '<leader>k', ":let @/=\"\"<CR>", {silent=true})
vim.keymap.set('n', '<leader>g', ":Rg<CR>", {silent = true})
vim.keymap.set('n', '<leader>c', function() print("real lua function") end)
-- ================================ --
-- CUSTOM FUNCTIONS --
-- ================================ --
--
--local JsFzfImport = function()
 --   print("Henlo!")
--end
-- imap {"<c-l>", JsFzfImport()}
vim.keymap.set('i', '<c-l>', function() print("real lua function") end)
-- ================================ --
-- PLUGIN CONFIGS --
-- ================================ --
nmap {"<leader>n", ":NERDTreeFocus<CR>"}
nmap {"<C-n>", ":NERDTree<CR>"}
nmap {"<C-t>", ":NERDTreeToggle<CR>"}
nmap {"<leader>t", ":NERDTreeToggle<CR>"}
nmap {"<C-f>", ":NERDTreeFind<CR>"}

-- legacy settings to import relative path
vim.cmd [[
function! s:generate_relative_js(path)
  let target = getcwd() . '/' . (join(a:path))
  let base = expand('%:p:h')

  let prefix = ""
  while stridx(target, base) != 0
    let base = substitute(system('dirname ' . base), '\n\+$', '', '')
    let prefix = '../' . prefix
  endwhile

  if prefix == ''
    let prefix = './'
  endif

  let relative = prefix . substitute(target, base . '/', '', '')

  let withJsTrunc = substitute(relative, '\.[tj]sx\=$', "", "")

  return withJsTrunc

endfunction

function! JsFzfImport()
  return fzf#vim#complete#path(
        \ "fd",
        \ fzf#wrap({ 'reducer': function('s:generate_relative_js')})
        \ )
endfunction

inoremap <expr> <C-l> JsFzfImport()

]]

