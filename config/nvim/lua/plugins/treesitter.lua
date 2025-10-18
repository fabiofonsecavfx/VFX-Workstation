return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Remove 'jsonc' from ensure_installed if present
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = vim.tbl_filter(function(lang)
        return lang ~= "jsonc"
      end, opts.ensure_installed)
    end
  end,
}
