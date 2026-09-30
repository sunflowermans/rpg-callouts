# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "rpg-callouts"
  spec.version = "1.0.0"
  spec.authors = ["directsun"]
  spec.email = []

  spec.summary = "Just the Docs callouts for RPG adventures (monster, item)."
  spec.license = "MIT"
  spec.homepage = "https://github.com/sunflowermans/rpg-callouts"

  spec.required_ruby_version = ">= 3.0"

  spec.files = Dir.glob("{lib,callouts}/**/*") + %w[LICENSE README.md]
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", ">= 3.8", "< 5.0"
end
