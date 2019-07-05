# frozen_string_literal: true

require_relative "base"

module LogPrinters
  class TotalVisits < Base
    NAME = "visits"

    private

    def visits_transformer(visits)
      visits.count
    end
  end
end
