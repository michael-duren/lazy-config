return {
  {
    "mfussenegger/nvim-lint",
    -- don't override the whole opts table: merge instead
    opts = function(_, opts)
      -- 1) register your Postgres linter
      opts.linters.postgrestools = {
        cmd = "postgrestools",
        args = { "check", "--format", "json", "$FILENAME" },
        stdin = false,
        ignore_exitcode = true,
        parser = function(output, bufnr)
          local diagnostics, text = {}, table.concat(output, "\n")
          local ok, decoded = pcall(vim.fn.json_decode, text)
          if not ok or type(decoded) ~= "table" then
            return diagnostics
          end
          for _, item in ipairs(decoded) do
            local row = item.range.start.line
            local col = item.range.start.character
            local sev = (item.severity or "WARNING"):upper()
            local severity = vim.diagnostic.severity[sev] or vim.diagnostic.severity.WARN
            table.insert(diagnostics, {
              lnum = row,
              col = col,
              message = item.message,
              severity = severity,
              source = "PostgresTools",
              bufnr = bufnr,
            })
          end
          return diagnostics
        end,
      }

      -- 2) tell nvim-lint to use only PostgresTools for .sql
      opts.linters_by_ft.sql = { "postgrestools" }

      -- 3) keep the existing events (so Go, Lua, etc. still lint)
      --    (you can tweak events here if needed)
      -- opts.events = { "BufWritePost", "InsertLeave" }

      return opts
    end,
  },
}
