lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prct06_tdd/version"

Gem::Specification.new do |spec|
  spec.name          = "prct06_tdd"
  spec.version       = Prct06Tdd::VERSION
  spec.authors       = ["Dario Afonso Rodriguez"]
  spec.email         = ["alu0100406580@ull.edu.es"]

  spec.summary       = %q{Impacto Ambiental}
  spec.description   = %q{Desarrollo Dirigido por Pruebas, representación de un programa en Ruby para el cálculo del Impacto Ambiental.}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100406580"

   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

   spec.metadata["homepage_uri"] = spec.homepage
   spec.metadata["source_code_uri"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100406580"
   #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

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
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end
