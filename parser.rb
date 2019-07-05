#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative "lib/report_generator"

file_path = ARGV[0]

abort "Invalid usage. Try ./parser.rb LOG_FILE_PATH." unless file_path

ReportGenerator.new(file_path).call
