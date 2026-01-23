local M = {}

local function insert_text(text)
	local pos = vim.api.nvim_win_get_cursor(0)
	local line = vim.api.nvim_get_current_line()
	-- Insert at cursor
	local new_line = line:sub(1, pos[2]) .. text .. line:sub(pos[2] + 1)
	vim.api.nvim_set_current_line(new_line)
	-- Move cursor
	vim.api.nvim_win_set_cursor(0, { pos[1], pos[2] + #text })
end

function M.setup(opts)
	opts = opts or {}

	-- BEAUTIFIED: 20-Jan-26|Tue
	-- %d = day, %b = month name, %y = short year, %a = weekday
	vim.keymap.set("n", opts.keymap_beauty or "<leader>dtb", function()
		insert_text(os.date("%d-%b-%y|%a"))
	end, { desc = "Insert beautified date" })

	-- SIMPLE: 2026-01-20T19H-22M
	vim.keymap.set("n", opts.keymap_simple or "<leader>dts", function()
		insert_text(os.date("%Y-%m-%d_%I:%M %p"))
	end, { desc = "Insert simple datetime" })
end

return M
