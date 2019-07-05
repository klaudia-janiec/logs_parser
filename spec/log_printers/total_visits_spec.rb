# frozen_string_literal: true

require "log_printers/total_visits"
require "spec_helper"

RSpec.describe LogPrinters::TotalVisits do
  it_behaves_like "logs printer" do
    let(:message) do
      <<~MESSAGE
        /help_page 2 visits
        /about 2 visits
        /home 1 visits
        /index 1 visits
      MESSAGE
    end
  end
end
