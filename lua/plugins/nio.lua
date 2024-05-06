return {
  "nvim-neotest/nvim-nio",
  config = function()
    local nio = require("nio")

    local task = nio.run(function()
      nio.sleep(10)
      print("Hello world")
    end)
  end,
}
