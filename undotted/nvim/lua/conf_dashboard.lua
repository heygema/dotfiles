  local home = os.getenv('HOME')
  local db = require('dashboard')
  -- macos
  db.preview_command = 'cat | lolcat -F 0.3'
  -- linux
  --db.preview_command = 'ueberzug'
  --
  db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  db.preview_file_height = 20
  db.preview_file_width = 70

  db.custom_center = {
      {icon = '∆  ',
      desc = 'Recently latest session                  ',
      shortcut = '-',
      action ='SessionLoad'},
      {icon = 'ƒ  ',
      desc = 'Recently opened files                   ',
      action =  'DashboardFindHistory',
      shortcut = '-'},
      {icon = 'ø  ',
      desc = 'Find  File                              ',
      action = ':Files',
      shortcut = '-'},
      {icon = '∑  ',
      desc = 'Find  word                              ',
      action = 'Rg',
      shortcut = '-'},
    }

db.custom_header = { 
   ' ███████████████████████████ ',
   ' ███████▀▀▀░░░░░░░▀▀▀███████ ',
   ' ████▀░░░░░░░░░░░░░░░░░▀████ ',
   ' ███│░░░░░░░░░░░░░░░░░░░│███ ',
   ' ██▌│░░░░░░░░░░░░░░░░░░░│▐██ ',
   ' ██░└┐░░░░░░░░░░░░░░░░░┌┘░██ ',
   ' ██░░└┐░░░░░░░░░░░░░░░┌┘░░██ ',
   ' ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██ ',
   ' ██▌░│██████▌░░░▐██████│░▐██ ',
   ' ███░│▐███▀▀░░▄░░▀▀███▌│░███ ',
   ' ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██ ',
   ' ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██ ',
   ' ████▄─┘██▌░░░░░░░▐██└─▄████ ',
   ' █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████ ',
   ' ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████ ',
   ' █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████ ',
   ' ███████▄░░░░░░░░░░░▄███████ ',
   ' ██████████▄▄▄▄▄▄▄██████████ ',
}

