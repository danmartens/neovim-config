return function()
  local function lualine_gps()
    local gps = require('nvim-gps')

    if gps.is_available() then
      return gps.get_location()
    else
      return ''
    end
  end

  require('lualine').setup({
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diagnostics' },
      lualine_c = { 'filename', lualine_gps },
      lualine_x = {},
      lualine_y = { 'filetype' },
      lualine_z = { 'location' },
    },
  })
end
