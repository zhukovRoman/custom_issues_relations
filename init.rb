

# ActionDispatch::Callbacks.to_prepare do
#   paths = '/lib/hooks/{patches/*_patch,hooks/*_hook}.rb'
#   Dir.glob(File.dirname(__FILE__) + paths).each do |file|
#     require_dependency file
#   end
# end

require_dependency 'hooks/views_issues_hook'

Redmine::Plugin.register :custom_issues_relations do
  name 'Custom Issues Relations plugin'
  author 'ISB'
  description 'add custom relations between issues'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'isb.one'

  settings :default => {'empty' => true}, :partial => 'settings/relations_settings'
end
