vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt
o.number = true
o.relativenumber = true
o.termguicolors = true
o.cursorline = true
o.signcolumn = "yes"
o.clipboard = "unnamedplus"
o.scrolloff = 8
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.splitright = true
o.splitbelow = true
o.updatetime = 250
o.fillchars = { eob = " " }

local ok, matugen = pcall(require, "matugen")
if ok then
  matugen.setup()
else
  require("base16-colorscheme").setup({
    base00 = "#282433", base01 = "#3f3951", base02 = "#57506f", base03 = "#6c6484",
    base04 = "#8f86a9", base05 = "#eae1f0", base06 = "#f4edf8", base07 = "#fdf9ff",
    base08 = "#e965a5", base09 = "#e9a56a", base0A = "#ebde76", base0B = "#b1f2a7",
    base0C = "#b3f4f3", base0D = "#a86cd3", base0E = "#e192ef", base0F = "#964f4f",
  })
end

require("nvim-web-devicons").setup()

require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
})

require("bufferline").setup({
  options = {
    separator_style = "slant",
    diagnostics = "nvim_lsp",
    offsets = { { filetype = "neo-tree", text = "Files", highlight = "Directory" } },
  },
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
  dashboard.button("g", "  Grep", "<cmd>Telescope live_grep<cr>"),
  dashboard.button("r", "  Recent", "<cmd>Telescope oldfiles<cr>"),
  dashboard.button("e", "  Explorer", "<cmd>Neotree toggle<cr>"),
  dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
}
alpha.setup(dashboard.config)

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  presets = {
    command_palette = true,
    bottom_search = true,
    lsp_doc_border = true,
  },
})
vim.notify = require("notify")

require("ibl").setup({ scope = { enabled = true } })
require("which-key").setup()
require("gitsigns").setup()
require("nvim-autopairs").setup()

require("neo-tree").setup({
  close_if_last_window = true,
  filesystem = { follow_current_file = { enabled = true } },
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    if pcall(vim.treesitter.start, ev.buf) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

require("telescope").setup({})

require("blink.cmp").setup({
  keymap = { preset = "enter" },
  completion = {
    documentation = { auto_show = true },
    menu = { draw = { columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } } } },
  },
})

vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
vim.lsp.config("lua_ls", {
  settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})
vim.lsp.enable({ "nixd", "lua_ls", "rust_analyzer", "gopls", "pyright", "ts_ls" })

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = { border = "rounded" },
})

local map = vim.keymap.set
map("n", "<Esc>", "<cmd>nohlsearch<cr>")
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostics" })
