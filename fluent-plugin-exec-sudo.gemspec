# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-exec-sudo"
  spec.version       = "0.0.3"
  spec.authors       = ["Tatsuya Deguchi"]
  spec.email         = ["t.deg84@gmail.com"]

  spec.summary       = "out_exec with sudo for Fluentd"
  spec.homepage      = "https://github.com/deg84/fluent-plugin-exec-sudo"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "fluentd"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "rspec"
end
