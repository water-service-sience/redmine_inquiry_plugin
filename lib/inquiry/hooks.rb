module InquiryPlugin

  class Hooks < Redmine::Hook::ViewListener
  
    render_on :view_issues_new_top,
              :partial => 'issues/view_issues_new_top'
    
    render_on :view_issues_form_details_bottom,
              :partial => 'issues/view_issues_form_details_bottom'
  

    def controller_issues_new_after_save(context = {})
      issue = context[:issue]
      params = context[:params]
      customer_id = params[:customer_id]
      geo_info_id = params[:geo_info_id]
      ext = IssueExtInquiry.new()
      ext.issue_id = issue.id
      ext.customer_id = customer_id
      ext.geo_info_id = geo_info_id
      ext.save()
      
    end
  
  end
end