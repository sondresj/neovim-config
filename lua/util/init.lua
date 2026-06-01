local M = {}

---@return (uv.uv_timer_t?)
M.setTimeout = function(callback, timeout)
	local timer = vim.uv.new_timer()

	if timer ~= nil then
		timer:start(timeout, 0, function()
			timer:stop()
			timer:close()
			callback()
		end)
	end

	return timer
end

---@param timer (uv.uv_timer_t?)
M.clearTimeout = function(timer)
	if timer ~= nil then
		timer:stop()
		timer:close()
	end
end

---@param fn function(...any): nil
---@param ms (integer)
M.debounce = function(fn, ms)
	local timer = nil

	local function wrapped_fn(...)
		local args = { ... }
		local argc = select("#", ...)

		M.clearTimeout(timer)

		timer = M.setTimeout(function()
			timer = nil
			pcall(fn, unpack(args, 1, argc))
		end, ms)
	end

	return wrapped_fn
end

-- Source - https://stackoverflow.com/a/30757399
local function table_eq(t1, t2, ignore_mt)
	if t1 == t2 then
		return true
	end

	local ty1 = type(t1)
	local ty2 = type(t2)

	if ty1 ~= ty2 then
		return false
	end

	-- non-table types can be directly compared
	if ty1 ~= "table" and ty2 ~= "table" then
		return t1 == t2
	end

	-- as well as tables which have the metamethod __eq
	if not ignore_mt then
		local mt = getmetatable(t1)
		if mt and mt.__eq then
			return t1 == t2
		end
	end

	local keySet = {}

	for k1, v1 in pairs(t1) do
		local v2 = t2[k1]
		if v2 == nil or not table_eq(v1, v2, ignore_mt) then
			return false
		end
		keySet[k1] = true
	end

	for k2, _ in pairs(t2) do
		if not keySet[k2] then
			return false
		end
	end

	return true
end

---@generic T
---@param fn function(...any): T
---@return function(...any): T
M.memoize_unary = function(fn)
	local last_args = nil
	local last_val = nil

	local wrapped = function(...)
		local args = { ... }
		local argc = select("#", ...)

		if last_val ~= nil and last_args ~= nil then
			if table_eq(args, last_args) then
				return last_val
			end
		end

		last_args = args
		last_val = fn(table.unpack(args, 1, argc))

		return last_val
	end

	return wrapped
end

---@param bytes integer
M.human_size = function(bytes)
	if not bytes or bytes == 0 then
		return "0 B"
	end
	local absb = math.abs(bytes)
	local units = { "B", "KB", "MB", "GB", "TB", "PB" }
	local base = 1024
	local exp = math.floor(math.min(#units - 1, math.max(0, math.log(absb) / math.log(base))))
	local value = bytes / (base ^ exp)
	return string.format("%.2f %s", value, units[exp + 1])
end

return M
