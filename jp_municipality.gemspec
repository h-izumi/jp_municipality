$:.push File.expand_path("../lib", __FILE__)

require "jp_municipality/version"

Gem::Specification.new do |s|
  s.name        = "jp_municipality"
  s.version     = JpMunicipality::VERSION
  s.authors     = ["Hayato IZUMI"]
  s.email       = ["h-izumi@9uelle.jp"]
  s.summary     = "JIS X 0402 (Identification code for cities, towns and villages) for Rails."
  s.homepage    = "https://jpmunicipality.9uelle.jp/"
  s.license     = "MIT"

  s.files  = %w[CHANGELOG.md CODE_OF_CONDUCT.md MIT-LICENSE README.ja.md README.md jp_municipality.gemspec]
  s.files += Dir["{app,data,db,lib}/**/*"]

  s.add_dependency "railties", ">= 5.1.5", "< 6.0"
  s.add_dependency "activerecord", ">= 5.1.5", "< 6.0"
  s.add_dependency "jp_prefecture"

  s.add_development_dependency "rails", ">= 5.2.3"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_bot_rails"
end
