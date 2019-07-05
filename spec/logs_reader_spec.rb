# frozen_string_literal: true

require "logs_reader"
require "spec_helper"

RSpec.describe LogsReader do
  let(:service) { described_class.new(file_path) }

  describe "#call" do
    subject { service.call }

    context "when file exists" do
      let(:file_path) { "spec/fixtures/sample.log" }

      before { subject }

      it "parses logs properly" do
        expect(service.log_entries).to match(
          "/help_page" => contain_exactly("126.318.035.038", "929.398.951.889"),
          "/about" => contain_exactly("184.123.665.067", "184.123.665.067"),
          "/home" => contain_exactly("184.123.665.067"),
          "/index" => contain_exactly("444.701.448.104")
        )
      end
    end

    context "when file doesn't exist" do
      let(:file_path) { "spec/fixtures/not_exist.log" }

      it "raises error Errno::ENOENT" do
        expect { subject }.to raise_error(Errno::ENOENT)
      end
    end
  end
end
