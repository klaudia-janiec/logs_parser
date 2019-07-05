# frozen_string_literal: true

class LogsReader
  attr_reader :file_path, :log_entries

  def initialize(file_path)
    @file_path = file_path
    @log_entries = Hash.new { |hash, key| hash[key] = [] }
  end

  def call
    file.each_line.lazy.each do |line|
      url, ip = line.split(" ")

      log_entries[url] << ip
    end
  end

  private

  def file
    File.open(file_path, "r")
  end
end
