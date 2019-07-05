# frozen_string_literal: true

RSpec.shared_examples "logs printer" do
  describe "#call" do
    let(:log_entries) do
      {
        "/help_page" => ["126.318.035.038", "929.398.951.889"],
        "/about" => ["184.123.665.067", "184.123.665.067"],
        "/home" => ["184.123.665.067"],
        "/index" => ["444.701.448.104"]
      }
    end

    subject { described_class.new(log_entries).call }

    it "prints proper message to output" do
      expect { subject }.to output(message).to_stdout
    end
  end
end
