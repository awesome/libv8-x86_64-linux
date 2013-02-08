# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "libv8/version"

Gem::Specification.new do |gem|
  gem.name        = "libv8"
  gem.version     = Libv8::VERSION
  #gem.platform    = Gem::Platform::RUBY
  gem.platform    = "x86_64-linux"
  gem.authors     = ["Charles Lowell"]
  gem.email       = ["cowboyd@thefrontside.net"]
  #gem.homepage    = "http://github.com/cowboyd/libv8"
  gem.homepage    = "http://github.com/awesome/libv8-x86_64-linux"
  gem.summary     = %q{Distribution of the V8 JavaScript engine (unofficial fork--just a copy from a debian box for SoAwesomeMan's Gemfile convenience)}
  gem.description = %q{Distributes the V8 JavaScript engine in binary and source forms in order to support fast builds of The Ruby Racer (unofficial fork--just a copy from a debian box for SoAwesomeMan's Gemfile convenience)}

  #gem.rubyforge_project = "libv8"


  gem.files  = `git ls-files`.split("\n")
  gem.files += Dir.chdir("vendor/v8") do
    `git ls-files`.split("\n").reject {|f| f =~ /^out/}.map {|f| "vendor/v8/#{f}"}
  end
  gem.files += Dir['vendor/v8/build/**/*']

  gem.extensions = ["ext/libv8/extconf.rb"]
  gem.require_paths = ["lib", "ext"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rake-compiler"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rspec-spies"
  gem.add_development_dependency "vulcan"
end
