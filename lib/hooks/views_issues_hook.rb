
class ViewsIssuesHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_details_bottom, partial: 'hooks_views/show_related_issues'
end