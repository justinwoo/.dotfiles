nonScratchFilter = hs.window.filter.new()

nonScratchFilter:setFilters({hs.window.filter.windowVisible})

nonScratchFilter:rejectApp("Slack")
nonScratchFilter:rejectApp("iTerm2")
nonScratchFilter:rejectApp("Telegram")
nonScratchFilter:rejectApp("Finder")
