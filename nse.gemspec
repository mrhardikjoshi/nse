
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "nse/version"

Gem::Specification.new do |spec|
  spec.name          = "nse"
  spec.version       = NSE::VERSION
  spec.authors       = ["h4hardikonly"]
  spec.email         = ["h4hardikonly@gmail.com"]

  spec.summary       = %q{Gem to interact with National Stock Exchange (NSE) web service and retrive various information}
  spec.description   = %q{This gem provides a way to get equity information, top loosers gainers, realtime pricing and bids from NSE}
  spec.homepage      = "https://github.com/h4hardikonly/nse"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.a"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency 'httparty', '~> 0.15.6'
end
