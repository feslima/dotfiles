local c_status_ok, comment = pcall(require, "Comment")
if not c_status_ok then
  vim.notify("Couldn't load 'Comment' plugin!")
  return
end

local ts_ctx_status_ok, _ = pcall(require, "ts_context_commentstring")
if not ts_ctx_status_ok then
  vim.notify("Couldn't load 'ts_context_commentstring' plugin for 'Comment'!")
  return
end

comment.setup {
  pre_hook = function(ctx)
        -- Only calculate commentstring for tsx filetypes
        if vim.bo.filetype == 'typescriptreact' then
            local U = require('Comment.utils')

            -- Detemine whether to use linewise or blockwise commentstring
            local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

            -- Determine the location where to calculate commentstring from
            local location = nil
            if ctx.ctype == U.ctype.block then
                location = require('ts_context_commentstring.utils').get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = require('ts_context_commentstring.utils').get_visual_start_location()
            end

            return require('ts_context_commentstring.internal').calculate_commentstring({
                key = type,
                location = location,
            })
        end
    end,
}
