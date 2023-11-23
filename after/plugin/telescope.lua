local fb_actions = require "telescope".extensions.file_browser.actions

require("telescope").setup({
   defaults = {
       file_sorter = require("telescope.sorters").get_fzy_sorter,
       prompt_prefix = " >",
       color_devicons = true,

       file_previewer = require("telescope.previewers").vim_buffer_cat.new,
       grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
       qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

       file_ignore_patterns = {"node_modules", ".class"}
   },
   find_files = {
       path_display = { "tail"}
   },
   extensions = {
       file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          follow_symlinks = true,
          mappings = {
            ["i"] = {
                ["<C-a>"] = fb_actions.change_cwd,
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        }
   },
})
require("telescope").load_extension("file_browser")
