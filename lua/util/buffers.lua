local M = {}

--- @param predicate fun(buf: number): boolean buffer filter predicate
function M.delete_bufs(predicate)
	for _, b in ipairs(vim.tbl_filter(predicate, vim.api.nvim_list_bufs())) do
		if not vim.bo[b].modified and vim.bo[b].buflisted then
			pcall(vim.cmd("bdelete! " .. b))
		end
	end
end

function M.close_others()
	local cur_buf = vim.api.nvim_get_current_buf()
	M.delete_bufs(function(b)
		return b ~= cur_buf
	end)
end

function M.close_left()
	local cur_buf = vim.api.nvim_get_current_buf()
	M.delete_bufs(function(b)
		return b < cur_buf
	end)
end

function M.close_right()
	local cur_buf = vim.api.nvim_get_current_buf()
	M.delete_bufs(function(b)
		return b > cur_buf
	end)
end

function M.close_unmodified()
	M.delete_bufs(function(b)
		return not vim.bo[b].modified
	end)
end

return M
