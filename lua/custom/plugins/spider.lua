return {
  'chrisgrieser/nvim-spider',
  lazy = true,
  enabled=true,
  keys = {
    { 'w',  function() require('spider').motion('w') end,  mode = { 'n', 'o', 'x' }, desc = 'Spider-w' },
    { 'e',  function() require('spider').motion('e') end,  mode = { 'n', 'o', 'x' }, desc = 'Spider-e' },
    { 'b',  function() require('spider').motion('b') end,  mode = { 'n', 'o', 'x' }, desc = 'Spider-b' },
    { 'W',  function() require('spider').motion('W') end,  mode = { 'n', 'o', 'x' }, desc = 'Spider-W' },
  },
  config = function()
    require('spider').setup {
      skipInsignificantPunctuation = true,
      consistentOperatorPending = false,
      subwordMovement = true,
      customPatterns = {},
    }
    
  end,
}
