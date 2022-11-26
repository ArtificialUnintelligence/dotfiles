local function project_name()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
end

require('lualine').setup({
    options = {
        component_separators = { left = ' ', right = ' '},
        globalstatus = true
    },
    sections = {
    lualine_a = {'mode'},
    lualine_b = {project_name, 'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
})
