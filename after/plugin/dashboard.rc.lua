local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

db.preview_file_height = 11
db.preview_file_width = 70
db.default_banner = {
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠤⠤⠤⠤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠄⠊⠉⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠒⠒⠒⠒⠒⠤⠄⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⣠⡖⡇⠀⠀⣴⠊⢹⡏⠉⠑⢦⠀⠀⠀⢀⡴⣶⠒⠒⠤⣄⠀⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⢰⢳⠙⡇⠀⠀⠘⢦⣀⠀⠀⣀⠞⡀⠀⠀⠸⡀⠉⠀⠀⠀⢈⡇⠀⠀⠀⢀⡧⢤⡀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⢸⡼⠀⣷⠀⠀⠀⠀⠈⠉⠁⠀⠀⡗⠀⠀⠀⠙⠒⠠⠤⠖⠋⠀⠀⠀⠀⣸⡤⢦⡇⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠈⢧⠘⢿⠀⠀⠀⠀⠀⠀⠀⠀⣰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡋⠀⢼⡇⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⣼⡄⠀⠀⠀⠀⠀⠀⠀⠙⠷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠏⡇⢀⡼⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡜⠘⣡⠞⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡀⠀⠀⠀⠀⠀⢠⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠓⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡀⠀⠀⠀⠀⠈⠉⠛⠛⠋⠀⠀⠀⠀⠀⠀⢀⡼⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡶⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⣄⡀⠀⠀⠀⠀⠀⠀⢀⡠⠞⠁⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣨⣿⡿⣷⠶⣤⣴⣶⠚⠉⠀⠀⢠⡧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠤⢴⠞⢁⣴⠏⠳⠬⠿⡾⠟⠁⠀⠀⠀⠀⠸⣇⠙⣏⠉⠒⠢⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⡤⠤⠒⠚⠉⠀⠀⠊⢠⣿⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣆⠈⢳⣀⣀⣀⡀⠈⠑⢦⡀⠀⠀⠀⠀',
'⠀⠀⣠⠖⠛⠁⢀⣤⣾⣿⣷⣶⠀⡎⠸⣄⠱⣄⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⣸⢿⣆⠀⢻⣿⣿⣿⣷⣄⢀⡙⠲⢤⡀⠀',
'⠀⣼⠷⢤⡀⠑⠿⣿⣿⣿⠿⠋⡸⠁⠀⠈⠢⣈⠙⠒⢤⣤⣶⠒⠊⠁⣀⠔⠁⠈⠈⠢⣀⠙⠛⠿⠟⠋⠁⣀⠤⢾⡷⠀',
'⠠⠃⠀⠀⠙⠦⣄⡀⠀⢀⣠⠔⠁⠀⠀⠀⠀⠀⠉⢳⣎⠃⣿⠷⡖⠉⠀⠀⠀⠀⠀⠀⠈⠑⠒⠒⠒⠂⠉⠀⠀⠀⢳⠀',
'⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣏⠳⠈⡶⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡇',
'          --[ Welcom ruben-epic ]--         '
}

db.custom_center = {
  {
    icon = '📁',
    desc = "New File",
    action = "DashboardNewFile",
    shortcut = ' df'
  },
  {
    icon = '📖',
    desc = "Find file",
    shortcut=" sf"
  },
}