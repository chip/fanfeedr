module Fanfeedr

  class Error < StandardError; end
  class ApiKeyMissing < Error; end
  class LeagueIdMissing < Error; end
  class LeagueNotFound < Error; end
  class ConferenceIdMissing < Error; end

end
