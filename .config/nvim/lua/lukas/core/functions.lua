-- Define a function to highlight long lines
function Highlight_long_lines(line_len)
	-- Get the current buffer
	local buf = vim.api.nvim_get_current_buf()

	-- Remove any existing highlights
	vim.api.nvim_buf_clear_namespace(buf, -1, 0, -1)

	local namesp = vim.api.nvim_create_namespace("LongHigh")
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	-- Iterate over each line in the buffer
	for i, line in ipairs(lines) do
		if #line > line_len then
			-- Highlight the 81st character with a different background color
			vim.api.nvim_buf_set_extmark(buf, namesp, i - 1, line_len, {
				end_col = line_len + 1,
				hl_group = "LongLineBorder",
				hl_mode = "replace",
			})
		end
	end

	-- Define a custom highlight group for the border character
	vim.api.nvim_set_hl(0, "LongLineBorder", {
		undercurl = true,
		bg = "#0d0c0c",
		fg = "#FFA066",
	})
end
