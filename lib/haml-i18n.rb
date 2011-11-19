require 'haml'
require 'active_support/all'

module HamlI18n
  module Internationalizer
    def self.included(base)
      base.class_eval do
        alias_method_chain :plain, :i18n
        alias_method_chain :parse_tag, :i18n
      end
    end
    
    private
    
    def plain_with_i18n(text, escape_html = nil)
      i18n_text = translate(text)
      plain_without_i18n(i18n_text, escape_html)
    end
    
    def parse_tag_with_i18n(line)
      tag_name, attributes, attributes_hash, object_ref, nuke_outer_whitespace, nuke_inner_whitespace, action, value = parse_tag_without_i18n(line)
      
      i18n_value = action || value.blank? ? value : translate(value)
      
      [tag_name, attributes, attributes_hash, object_ref, nuke_outer_whitespace, nuke_inner_whitespace, action, i18n_value]
    end
    
    def translate(text)
      simple_key = text.parameterize.underscore
      
      filename_components = options[:filename].match(/\/views\/([^\/]+)\/([^\/]+).html.haml/)
      key = filename_components ? "#{filename_components[1]}.#{filename_components[2]}.#{simple_key}" : simple_key
      
      begin
        I18n.translate(key, raise: true)
      rescue I18n::MissingTranslationData
        I18n.translate(simple_key)
      end
    end
  end
end

module Haml
  class Engine
    include HamlI18n::Internationalizer
  end
end