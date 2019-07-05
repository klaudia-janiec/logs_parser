# frozen_string_literal: true

require_relative "base"

module LogPrinters
  class UniqueVisits < Base
    NAME = "unique views"

    private

    def visits_transformer(visits)
      visits.uniq.count
    end
  end
end
