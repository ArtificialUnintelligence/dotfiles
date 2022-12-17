local wk = require("which-key")

wk.register({
  ["<leader>w"] = "jump to last buffer",
  ["<leader>bd"] = "delete buffer",
  ["<leader>bx"] = "delete other buffers",
  -- Telescope remaps
  ["<leader>fb"] = "browse open buffers",
  ["<leader>fe"] = "file explorer",
  ["<leader>lg"] = "live grep",
  ["<leader>ht"] = "help tags",
  ["<leader>tt"] = "toggle terminal",
  -- Git remaps
  ["<leader>gs"] = "git status",
  ["<leader>gj"] = "git pull",
  ["<leader>gk"] = "git push",
  ["<leader>gb"] = "git branches",
  ["<leader>gc"] = "git commit",
  ["<leader>gl"] = "git log",
  ["<leader>gt"] = "git stash",
  ["<leader>gx"] = "git revert changes",
  ["<leader>cu"] = "commit 'undo' (revert)",
  ["<leader>cr"] = "commit reset",
  ["<leader>cc"] = "commit cherry-pick",
  -- Terminal remaps
  ["<leader>tt"] = "terminal toggle",
  ["<leader>ts"] = "tomcat start",
  ["<leader>tf"] = "tomcat copy files",
  ["<leader>tw"] = "tomcat copy war",
  ["<leader>mb"] = "maven build",
  ["<leader>js"] = "jboss start",
  ["<leader>jf"] = "jboss copy files"
})
