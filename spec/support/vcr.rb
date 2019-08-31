require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = ENV['CI'] ? 'spec/vcr_ci' : 'spec/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  # Match requests body with VCR.
  if ENV['CI']
    c.default_cassette_options = { match_requests_on: [:method, :uri, :body] }
  end
end
