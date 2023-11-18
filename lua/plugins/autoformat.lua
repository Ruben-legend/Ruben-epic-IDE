return{
  "elentok/format-on-save.nvim",
  config = function ()
    require('format-on-save').setup({
  auto_commands = false,
  user_commands = false,
})
    
  end
}
