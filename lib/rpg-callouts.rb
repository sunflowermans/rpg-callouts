# frozen_string_literal: true

require "yaml"
require "jekyll"

require_relative "rpg_callouts/version"
require_relative "rpg_callouts/merge"

module RpgCallouts
  module_function

  def root
    File.expand_path("..", __dir__)
  end

  def default_config_path
    File.join(root, "callouts", "config.yml")
  end

  def apply!(site)
    options = site.config["rpg_callouts"] || {}
    return if options["enabled"] == false

    path = options["config_file"] || default_config_path
    fragment = load_fragment(path, site)
    return if fragment.empty?

    RpgCallouts::Merge.into_site!(site, fragment)
    Jekyll.logger.info("rpg-callouts:", "merged callouts into site config")
  end

  def load_fragment(path, site)
    resolved = resolve_config_path(path, site)
    raise ArgumentError, "rpg-callouts config missing: #{resolved}" unless File.file?(resolved)

    data = YAML.safe_load(
      File.read(resolved),
      permitted_classes: [Date, Time, Symbol],
      aliases: true
    )
    raise ArgumentError, "rpg-callouts config must be a mapping: #{resolved}" unless data.is_a?(Hash)

    data
  end

  def resolve_config_path(path, site)
    return path if absolute_path?(path)
    return default_config_path if path == default_config_path

    candidates = [
      File.expand_path(path, site.source),
      File.expand_path(path, Dir.pwd),
      File.expand_path(path, root)
    ]
    candidates.find { |candidate| File.file?(candidate) } || candidates.first
  end

  def absolute_path?(path)
    path.start_with?(File::SEPARATOR) || path.match?(/\A[A-Za-z]:[\\\/]/)
  end
end

Jekyll::Hooks.register :site, :after_reset do |site|
  RpgCallouts.apply!(site)
end
