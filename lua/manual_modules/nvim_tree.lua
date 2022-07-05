if pcall(require, "nvim-tree") then
    require("nvim-tree").setup({
        disable_netrw = false,
        hijack_netrw = true,
        respect_buf_cwd = true,
        view = {
          number = true,
          relativenumber = true,
        },
        filters = {
          custom = { ".git" },
        },
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
    })
else
    print("nvim-tree not working")
end
