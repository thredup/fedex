def fedex_credentials
  @fedex_credentials ||= credentials["development"]
end

def fedex_production_credentials
  @fedex_production_credentials ||= credentials["production"]
end

private

def credentials
  @credentials ||= begin
    YAML.load_file("#{File.dirname(__dir__)}/config/fedex_credentials.#{'ci.' if ENV['CI']}yml")
  end
end
