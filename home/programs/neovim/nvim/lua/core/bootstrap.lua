local core = {
  packer = {
    bootstrap = false,
    config = {
      profile = {
        enable = true,
        threshold = 0,
      },
      opt_default = false,
    },
  },
}

return core
