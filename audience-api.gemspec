lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "audience/api/version"

Gem::Specification.new do |spec|
  spec.name          = "audience-api"
  spec.version       = Audience::Api::VERSION
  spec.authors       = ["Semjon Molokanov"]
  spec.email         = ["semjon.molokanov@mynewsdesk.com"]

  spec.summary       = "MND-Audience API client"
  spec.description   = "Faraday based client for MND-Audience API"
  spec.homepage      = "http://mnd-audience.herokuapp.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "faraday", "~> 1.0"
  spec.add_runtime_dependency "faraday_middleware", "~> 1.0"
  spec.add_runtime_dependency "multi_json", "~> 1.0"
  spec.add_runtime_dependency "hashie"
end
