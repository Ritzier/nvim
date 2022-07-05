local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	print("Impatient not wor")
	return
end

impatient.enable_profile()
