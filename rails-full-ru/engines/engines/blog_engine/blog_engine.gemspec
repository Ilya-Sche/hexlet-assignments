require_relative "lib/blog_engine/version"

Gem::Specification.new do |spec|
  spec.name        = "blog_engine"
  spec.version     = BlogEngine::VERSION
  spec.authors     = [ "Ilya_sche" ]
  spec.email       = [ "Ilya_rostov_2004@mail.ru" ]
  # spec.homepage    = "http://localhost:3001"
  spec.summary     = "Summary of BlogEngine."
  spec.description = "Description of BlogEngine."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.2.1"
end
