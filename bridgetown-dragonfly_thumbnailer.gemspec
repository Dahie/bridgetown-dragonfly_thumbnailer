# frozen_string_literal: true

require_relative "lib/dragonfly_thumbnailer/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown-dragonfly_thumbnailer"
  spec.version       = DragonflyThumbnailer::VERSION
  spec.author        = "Daniel Senff"
  spec.email         = "mail@danielsenff.de"
  spec.summary       = "Sample code for creating new Bridgetown plugins"
  spec.homepage      = "https://github.com/bridgetownrb/bridgetown-sample-plugin"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^spec/!)
  spec.require_paths = ["lib"]
  spec.metadata      = { "yarn-add" => "bridgetown-dragonfly_thumbnailer@#{DragonflyThumbnailer::VERSION}" }

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_dependency "bridgetown", ">= 0.15"
  spec.add_dependency "dragonfly"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-bridgetown", "~> 0.2"
end
