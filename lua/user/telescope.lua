local status_ok_tel, tel = pcall(require, "telescope")
local status_ok_nc, nc = pcall(require, "neoclip")
local status_ok_proj, proj = pcall(require, "project_nvim")


if not status_ok_tel then
    return
end

tel.setup()

if status_ok_nc then
    nc.setup()
    tel.load_extension("neoclip")
end


if status_ok_proj then
    proj.setup({
        detection_methods = { 'pattern' }
    })
    tel.load_extension('projects')
end
