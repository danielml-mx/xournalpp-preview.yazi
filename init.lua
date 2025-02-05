local M = {}

function M:peek(job)
	local cache = ya.file_cache(job)
	if not cache then
		return
	end

	if M:preload(job) == 1 then
		ya.image_show(cache, job.area)
		ya.preview_widgets(job, {})
	end
end

function M:seek(job)
	-- TODO
end

function M:preload(job)
	local cache = ya.file_cache(job)
	if not cache or fs.cha(cache) then
		return 1
	end

	local child, code = Command("xournalpp"):args({
		tostring(job.file.url),
		"-n",
		"1",
		job.skip + 1,
		"-i",
		tostring(cache),
		"--export-range=1",
	}):spawn()

	if not child then
		return true, Err("Failed: %s", code)
	end

	local status = child:wait()
	return status and status.success and 1 or 2
end

return M
