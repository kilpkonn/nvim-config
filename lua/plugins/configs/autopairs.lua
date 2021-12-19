local present1, autopairs = pcall(require, "nvim-autopairs")
local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
local present3, cmp = pcall(require, 'cmp')

if not (present1 or present2 or present3) then
  return
end

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

autopairs.setup()
