require 'rspec'
require 'fedex'
require 'support/vcr'
require 'support/credentials'
require 'pry'

RSpec.configure do |config|
  config.filter_run_excluding :production unless fedex_production_credentials
  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }

  config.before do
    # Freeze time on CI to exact match constructed requests body with VCR.
    if ENV['CI']
      allow(Time).to receive(:now).and_return(Time.new(2019, 8, 24, 1, 34, 25, '+00:00'))
    end
  end
end
