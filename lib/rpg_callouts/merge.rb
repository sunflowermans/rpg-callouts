# frozen_string_literal: true

module RpgCallouts
  # Deep-merges gem/config fragments into `site.config`.
  # Later overlays win within the fragment; site `_config.yml` wins overall.
  module Merge
    module_function

    def into_site!(site, fragment)
      fragment.each do |key, value|
        site.config[key] = deep_merge(value, site.config[key])
      end
    end

    # Overlay wins on leaf conflicts. Hashes merge recursively.
    def deep_merge(base, overlay)
      return dup_value(base) if overlay.nil?
      return dup_value(overlay) unless hash?(base) && hash?(overlay)

      result = stringify_keys(base)
      stringify_keys(overlay).each do |key, value|
        result[key] = result.key?(key) ? deep_merge(result[key], value) : dup_value(value)
      end
      result
    end

    def hash?(value)
      value.is_a?(Hash)
    end

    def stringify_keys(hash)
      hash.each_with_object({}) do |(key, value), out|
        out[key.to_s] = value
      end
    end

    def dup_value(value)
      case value
      when Hash
        value.each_with_object({}) { |(key, child), out| out[key.to_s] = dup_value(child) }
      when Array
        value.map { |child| dup_value(child) }
      else
        value
      end
    end
  end
end
