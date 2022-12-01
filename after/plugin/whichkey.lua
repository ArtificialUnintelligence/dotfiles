local wk = require("which-key")

wk.register({
  ["<leader>w"] = "jump to last buffer",
  ["<leader>fb"] = "browse open buffers",
  ["<leader>fe"] = "file explorer",
  ["<leader>lg"] = "live grep",
  ["<leader>ht"] = "help tags",
  ["<leader>t"] = "toggle terminal",
  ["<leader>gs"] = "git status",
  ["<leader>gl"] = "git pull",
  ["<leader>gh"] = "git push",
  ["<leader>gb"] = "git branches",
  ["<leader>gc"] = "git commit",
})
