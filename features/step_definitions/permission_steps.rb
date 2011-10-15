permission_step = /^"([^"]*)" can ([^"]*?) ([o|i]n)?\s?the "([^"]*)" project$/

Given permission_step do |user, permission, on, project| 
  create_permission(User.find_by_email!(user),
                    Project.find_by_name!(project),
                    permission)
end

When /^I check "([^"]*)" for "([^"]*)"$/ do |permission, name|
  project = Project.find_by_name!(name)
  permission = permission.downcase.gsub(" ", "_")
  field_id = "permissions_#{project.id}_#{permission}"
  steps(%Q{When I check "#{field_id}"})
end

def create_permission(user, object, action)
  Permission.create!(:user => user,
                     :thing => object,
                     :action => action)
end
