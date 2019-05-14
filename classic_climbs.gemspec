
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "classic_climbs/version"

Gem::Specification.new do |spec|
  spec.name          = "classic_climbs"
  spec.version       = ClassicClimbs::VERSION
  spec.authors       = ["kimpham54"]
  spec.email         = ["kimpham54@gmail.com"]

  spec.summary       = %q{hello}
  spec.description   = %q{hello}
  spec.homepage      = "https://www.mountainproject.com/area/classics?type=sport"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://www.mountainproject.com/area/classics?type=sport"
    spec.metadata["changelog_uri"] = "https://www.mountainproject.com/area/classics?type=sport"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri", ">= 1.8.5"
  # spec.add_development_dependency "open-uri"
end
