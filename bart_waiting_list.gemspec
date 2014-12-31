# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'bart_waiting_list'
  spec.version       = '0.0.4'
  spec.authors       = ["Brian O'Keefe"]
  spec.email         = ['brian@bokstuff.com']
  spec.summary       = %q{Get data from the BART select-a-spot waiting list page}
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/brianokeefe/bart_waiting_list'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'mechanize', '~> 2.7.3'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'webmock', '~> 1.20.4'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.1'
end
