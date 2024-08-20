return {
  "nvim-neotest/nvim-nio",
  config = function()
    local nio = require("nio")

    nio.run(function()
      nio.sleep(10)
      print("Hello Mane")
    end)
  end,
}
