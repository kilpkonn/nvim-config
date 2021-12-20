local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

 this line too ]]
--

-- Don't copy the replaced text after pasting in visual mode
map("v", "p", '"_dP', opt)

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using :map
map("", "j", 'v:count ? "j" : "gj"', {expr = true})
map("", "k", 'v:count ? "k" : "gk"', {expr = true})
map("", "<Down>", 'v:count ? "j" : "gj"', {expr = true})
map("", "<Up>", 'v:count ? "k" : "gk"', {expr = true})

-- OPEN TERMINALS --
map("n", "<C-l>", ":vnew +terminal | setlocal nobuflisted <CR>", opt) -- term over right
map("n", "<C-x>", ":10new +terminal | setlocal nobuflisted <CR>", opt) --  term bottom
map("n", "<C-t>t", ":terminal <CR>", opt) -- term buffer

-- copy whole file content
map("n", "<C-a>", ":%y+<CR>", opt)

-- toggle numbers
map("n", "<leader>n", ":set nu!<CR>", opt)

-- Truezen.nvim
map("n", "<leader>zz", ":TZAtaraxis<CR>", opt)
map("n", "<leader>zm", ":TZMinimalist<CR>", opt)
map("n", "<leader>zf", ":TZFocus<CR>", opt)

map("n", "<C-s>", ":w <CR>", opt)

-- Commenter Keybinding
-- map("n", "<leader>/", ":CommentToggle<CR>", opt)
-- map("v", "<leader>/", ":CommentToggle<CR>", opt)

-- nvimtree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)

-- format code
map("n", "<Leader>fm", ":Neoformat<CR>", opt)

-- dashboard stuff
map("n", "<Leader>db", ":Dashboard<CR>", opt)
map("n", "<Leader>fn", ":DashboardNewFile<CR>", opt)
map("n", "<Leader>bm", ":DashboardJumpMarks<CR>", opt)
map("n", "<C-s>l", ":SessionLoad<CR>", opt)
map("n", "<C-s>s", ":SessionSave<CR>", opt)

-- Telescope
map("n", "<Leader>fw", ":Telescope live_grep<CR>", opt)
map("n", "<Leader>gt", ":Telescope git_status <CR>", opt)
map("n", "<Leader>cm", ":Telescope git_commits <CR>", opt)
map("n", "<Leader>ff", ":Telescope find_files hidden=true <CR>", opt)
map("n", "<Leader>fp", ":Telescope media_files <CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)
map("n", "<Leader>fo", ":Telescope oldfiles<CR>", opt)
map("n", "<Leader>th", ":Telescope themes<CR>", opt)

map("n", "<Leader>gr", ":Telescope lsp_references<CR>", opt)
map("n", "<Leader>ca", ":Telescope lsp_code_actions<CR>", opt)
map("n", "gi", ":Telescope lsp_implementations<CR>", opt)
map("n", "gd", ":Telescope lsp_definitions<CR>", opt)
map("n", "<Leader>bd", ":Telescope lsp_document_diagnostics<CR>", opt)
map("n", "<Leader>wd", ":Telescope lsp_workspace_diagnostics<CR>", opt)

-- bufferline tab stuff
map("n", "<S-t>", ":enew<CR>", opt) -- new buffer
map("n", "<C-t>b", ":tabnew<CR>", opt) -- new tab
map("n", "<S-x>", ":bd!<CR>", opt) -- close tab

-- move between tabs
map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opt)

-- use ESC to turn off search highlighting
map("n", "<Esc>", ":noh<CR>", opt)


-- Vim Fugitive
map("n", "<Leader>gs", ":Git<CR>", opt)
map("n", "<Leader>gh", ":diffget //2<CR>", opt)
map("n", "<Leader>gl", ":diffget //3<CR>", opt)
map("n", "<Leader>gb", ":Git blame<CR>", opt)

-- DAP
map('n', '<F10>', ':lua require"dap".continue()<CR>')
map('n', '<F7>', ':lua require"dap".step_over()<CR>')
map('n', '<F6>', ':lua require"dap".step_into()<CR>')
map('n', '<F8>', ':lua require"dap".step_out()<CR>')
map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')

map('n', '<leader>dsc', ':lua require"dap.ui.variables".scopes()<CR>')
map('n', '<leader>dhh', ':lua require"dap.ui.variables".hover()<CR>')
map('v', '<leader>dhv', ':lua require"dap.ui.variables".visual_hover()<CR>')

map('n', '<leader>duh', ':lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>duf', ":lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

map('n', '<leader>dsbr', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
map('n', '<leader>dsbm', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
map('n', '<leader>dro', ':lua require"dap".repl.open()<CR>')
map('n', '<leader>drl', ':lua require"dap".repl.run_last()<CR>')


-- telescope-dap
map('n', '<leader>dcc', ':lua require"telescope".extensions.dap.commands{}<CR>')
map('n', '<leader>dco', ':lua require"telescope".extensions.dap.configurations{}<CR>')
map('n', '<leader>dlb', ':lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
map('n', '<leader>dv', ':lua require"telescope".extensions.dap.variables{}<CR>')
map('n', '<leader>df', ':lua require"telescope".extensions.dap.frames{}<CR>')

-- Cheatsheet
map('n', '<leader>?', ':Cheatsheet<CR>', opt)
