# frozen_string_literal: true

require "log_printers/unique_visits"
require "spec_helper"

RSpec.describe LogPrinters::UniqueVisits do
  it_behaves_like "logs printer" do
    let(:message) do
      <<~MESSAGE
        /help_page 2 unique views
        /about 1 unique views
        /home 1 unique views
        /index 1 unique views
      MESSAGE
    end
  end
end
