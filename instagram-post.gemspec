require_relative 'lib/instagram/post/version'

Gem::Specification.new do |spec|
  spec.name          = "instagram-post"
  spec.version       = Instagram::Post::VERSION
  spec.authors       = ["PaymaanKazemi"]
  spec.email         = ["paymankazemipymkz@gamil.com"]

  spec.summary       = 'instagram-post'
  spec.description   = 'send post publish photo to page instagram'
  spec.homepage      = "https://github.com/paymaan73/instagram-post"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = ['lib/instagram/post.rb', 'lib/instagram/post/auth.rb', 'lib/instagram/post/version.rb', 'lib/instagram/post/scope.rb', 'lib/instagram/post/link.rb', 'lib/instagram/post/config.rb', 'lib/instagram/post/token.rb', 'lib/instagram/post/token_link.rb', 'lib/instagram/post/ids.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
