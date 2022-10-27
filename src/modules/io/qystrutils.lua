local strutils = {}

--- Converts an uppercase string to a lowercase string.
function strutils.lowerStr(str)
	local astr
	if not (strutils.checkNil(str)) then
		astr = string.lower(str)
	end
	return astr
end

--- Converts a lower string to an uppercase string.
function strutils.upperStr(str)
	local bstr
	if not (strutils.checkNil(str)) then
		bstr = string.upper(str)
	end
	return bstr
end

--- Check if a string is "nil."
function strutils.checkNil(str)
	if (str == nil) then
		return true
	end
end

--- Find a certain string inside of a string.
function strutils.findString(s, f_str)
	if not (s == nil and f_str == nil) then
		if (string.find(s, f_str)) then
			return true
		end
	end
end

--- Check if a string is empty.
function strutils.checkEmpty(str)
	if (str == "" or str == " ") then
		return true
	end
end

--- Check if a string is nil or empty.
function strutils.checkNilOrEmpty(str)
	if (str == nil or str == "" or str == " ") then
		return true
	end
end

--- Checks if the first string is equal to the second string.
---
--- *`stra` == `strb` = true*
function strutils.checkStringEquals(str1, str2)
	if not (strutils.checkNil(str1) and strutils.checkNil(str2)) then
		if (str1 == str2) then
			return true
		end
	end
end

--- Checks if a variable is equal to a data type
---
--- [Available data types]:
---
---		| "nil"
---		| "number"
---		| "string"
---		| "boolean"
---		| "table"
---		| "function"
---		| "thread"
---		| "userdata"
function strutils.typeCheck(var, _type)
	local oututils = require("src.modules.io.qyoututils")
	local types = {
		"nil", "number", "string",
		"boolean", "table", "function",
		"thread", "userdata"
	}
	local bs = false
	if not (strutils.checkNil(var) and strutils.checkNil(_type)) then
		local type_matches = false
		for i = 1, #types do
			if (_type == types[i]) then type_matches = true end
		end
		if (type_matches) then
			if (type(var) == _type) then bs = true end
		else
			oututils.lnOutStr("Type \"" .. _type .. "\" is not available.")
		end
	end
	return bs
end

--- Check if string starts with another certain string, and returns it.
---
--- [Original Source](https://stackoverflow.com/a/22831842)
function strutils.startsWith(str, start)
	return string.sub(str, 1, string.len(start)) == start
end

return strutils
