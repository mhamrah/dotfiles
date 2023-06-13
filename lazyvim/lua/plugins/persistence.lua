return {
  { "folke/persistence.nvim", enabled = false },

  {
    "gennaro-tedesco/nvim-possession",
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    opts = {
      autoload = true,
      autoswitch = { enabled = true },
    },
    init = function()
      local possession = require("nvim-possession")
      vim.keymap.set("n", "<leader>ql", function()
        possession.list()
      end, { desc = "List all sessions" })
      vim.keymap.set("n", "<leader>qn", function()
        possession.new()
      end, { desc = "Create a new session" })
      vim.keymap.set("n", "<leader>qu", function()
        possession.update()
      end, { desc = "Update current session" })
    end,
  },
  { "goolord/alpha-nvim", enabled = false },
}
