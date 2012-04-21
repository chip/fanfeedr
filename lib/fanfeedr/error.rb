module Fanfeedr

  class Error < StandardError; end
  class ApiKeyMissing < Error; end
  class LeagueIdMissing < Error; end

end
