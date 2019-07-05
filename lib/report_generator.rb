# frozen_string_literal: true

require_relative "logs_reader"
require_relative "log_printers/total_visits"
require_relative "log_printers/unique_visits"

class ReportGenerator
  LOG_PRINTERS = [LogPrinters::TotalVisits, LogPrinters::UniqueVisits].freeze

  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def call
    LOG_PRINTERS
      .map { |printer| printer.new(logs_reader.log_entries) }
      .each(&:call)
  end

  private

  def logs_reader
    @logs_reader ||= LogsReader.new(file_path).tap(&:call)
  end
end
