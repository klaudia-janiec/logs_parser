# frozen_string_literal: true

require "report_generator"
require "spec_helper"

RSpec.describe ReportGenerator do
  let(:file_path) { double }

  describe "#call" do
    let(:logs_reader) { instance_double LogsReader }
    let(:log_entries) { double }
    let(:total_visits_printer) { instance_double LogPrinters::TotalVisits }
    let(:unique_visits_printer) { instance_double LogPrinters::UniqueVisits }

    before do
      allow(LogsReader).to receive(:new).with(file_path).and_return(logs_reader)
      allow(logs_reader).to receive(:call)
      allow(logs_reader).to receive(:log_entries).and_return(log_entries)
      allow(LogPrinters::TotalVisits).to receive(:new)
        .with(log_entries)
        .and_return(total_visits_printer)
      allow(LogPrinters::UniqueVisits).to receive(:new)
        .with(log_entries)
        .and_return(unique_visits_printer)
    end

    after { described_class.new(file_path).call }

    it "calls printers" do
      aggregate_failures do
        expect(total_visits_printer).to receive(:call).ordered
        expect(unique_visits_printer).to receive(:call).ordered
      end
    end
  end
end
