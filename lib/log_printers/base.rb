# frozen_string_literal: true

module LogPrinters
  class Base
    attr_reader :log_entries

    def initialize(log_entries)
      @log_entries = log_entries
    end

    def call
      results.each do |url, result|
        puts "#{url} #{result} #{self.class::NAME}"
      end
    end

    private

    def results
      log_entries
        .transform_values(&method(:visits_transformer))
        .sort_by { |_, result| -result }
    end
  end
end
