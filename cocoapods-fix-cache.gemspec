# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-fix-cache.rb'

Gem::Specification.new do |spec|
  spec.name          = 'cocoapods-fix-cache'
  spec.version       = CocoapodsFixCache::VERSION
  spec.authors       = ['chengcong']
  spec.email         = ['646376172@qq.com']
  spec.description   = %q{Fix CocoaPods cache bug}
  spec.summary       = %q{Fix Concurrent building occasionally cleans the Pods cache directory, see https://github.com/CocoaPods/CocoaPods/pull/11827}
  spec.homepage      = 'https://github.com/fabcz/cocoapods-fix-cache'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
