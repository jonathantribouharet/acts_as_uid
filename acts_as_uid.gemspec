# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
	s.files = `git ls-files`.split("\n")
	s.name = "acts_as_uid"
	s.platform = Gem::Platform::RUBY
	s.summary = "A plugin for generate UID for ActiveRecord model."
	s.homepage = "https://github.com/eviljojo22/acts_as_uid"
	s.require_paths = ["lib"]
	s.version = "1.0"
	s.author = "Jonathan TRIBOUHARET"
	s.email = "jonathan.tribouharet@gmail.com"
end