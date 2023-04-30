return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "js", "delve", "python", "codelldb" })
    end,
  },
}
