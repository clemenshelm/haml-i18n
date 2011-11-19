require File.expand_path("../../lib/haml-i18n.rb", __FILE__)
require 'i18N'
require 'haml'

describe HamlI18n do
  after { I18n.backend.reload! }
  
  it "looks up 'key' as 'key'" do
    I18n.backend.store_translations :en, key: 'Cheers'
    template = Haml::Engine.new 'key'
    template.render.should =~ /Cheers/
  end
  
  it "looks up 'Key' as 'key'" do
    I18n.backend.store_translations :en, key: 'Bless you'
    template = Haml::Engine.new 'Key'
    template.render.should =~ /Bless you/
  end
  
  it "looks up 'User name' as 'user_name'" do
    I18n.backend.store_translations :en, user_name: 'Kevin'
    template = Haml::Engine.new 'User name'
    template.render.should =~ /Kevin/
  end
  
  context "within a tag" do
    it "looks up 'key' as 'key'" do
      I18n.backend.store_translations :en, key: 'Cheers'
      template = Haml::Engine.new '%p key'
      template.render.should =~ /<p>Cheers<\/p>/
    end
    
    context "that is nested" do
      it "looks up 'key' as 'key'" do
        I18n.backend.store_translations :en, key: 'Cheers'
        template = Haml::Engine.new "%div\n\t%p key"
        template.render.should =~ /<p>Cheers<\/p>/
      end
    end
    
    context "within a ruby block" do
      it "doesn't look up anything" do
        template = Haml::Engine.new '%p= "Cheers"'
        template.render.should =~ /<p>Cheers<\/p>/
      end
    end
  end
  
  context "when there is a template path" do
    it "looks up 'key' as '[view_folder].[template_name].key'" do
      I18n.backend.store_translations :en, users: {index: {key: 'Cheers'}}
      template = Haml::Engine.new 'key', filename: '/long/path/to/views/users/index.html.haml'
      template.render.should =~ /Cheers/
    end
    
    it "looks up 'Key' as '[view_folder].[template_name].key'" do
      I18n.backend.store_translations :en, users: {index: {key: 'Cheers'}}
      template = Haml::Engine.new 'Key', filename: '/long/path/to/views/users/index.html.haml'
      template.render.should =~ /Cheers/
    end
    
    context "when there is no translation for the template path" do
      it "looks up 'key' as 'key'" do
        I18n.backend.store_translations :en, key: 'Cheers'
        template = Haml::Engine.new 'key', filename: '/long/path/to/views/users/index.html.haml'
        template.render.should =~ /Cheers/
      end
    end
  end
end