class IssueExtInquiry < ActiveRecord::Base
  unloadable
  
  
  def IssueExtInquiry.for_customer( customer_id)
    s = "select * from issue_ext_inquiries where customer_id = :customer_id"
    exts = IssueExtInquiry.find_by_sql([s, { :customer_id => customer_id}])
    p "##{exts}"
    
    issue_ids = []
    exts.each{ |e| issue_ids.push(e.issue_id)}
    issues = Issue.find_by_sql(["select * from issues where id in (:ids)", {:ids => issue_ids}])
    p "#3#{issues}"
    issues_array = []
    issues.each{ |e| issues_array.push(e)}
    ext_array = []
    exts.each{ |e| ext_array.push(e)}
    
    return issues_array.zip(ext_array)
  end
  
end
