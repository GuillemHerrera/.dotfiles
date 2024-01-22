-- Normal Mode
-- Next buffer tab with comma ,
lvim.keys.normal_mode[","] = ":BufferLineCycleNext<cr>"

-- Remap smashed home row keys to ESC
lvim.keys.insert_mode["jj"] = "<Esc>"
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.insert_mode["kj"] = "<Esc>"

