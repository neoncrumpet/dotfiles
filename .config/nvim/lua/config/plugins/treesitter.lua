return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "markdown",
        "markdown_inline",
        "lua",
        "typescript",
        "tsx",
        "rust",
        "go",
        "html",
        "bash",
        "javascript",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter-highlighting", { clear = true }),
        callback = function(args)
          local path = vim.api.nvim_buf_get_name(args.buf)
          local stat = vim.uv.fs_stat(path)
          if stat and stat.size > 100 * 1024 then
            return
          end

          -- Neovim includes parsers for the configured core filetypes.
          -- Other filetypes start highlighting once their parser is installed.
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
