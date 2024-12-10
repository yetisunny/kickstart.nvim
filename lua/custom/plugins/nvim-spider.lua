return {
  'chrisgrieser/nvim-spider',
  lazy = true,
  setup = function()
    require('spider').setup {
      skipInsignificantPunctuation = false,
      consistentOperatorPending = false, -- see "Consistent Operator-pending Mode" in the README
      subwordMovement = true,
      customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
    }
  end,
}
