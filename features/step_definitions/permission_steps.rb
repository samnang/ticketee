permission_step = /^"([^"]*)" can ([^"]*?) ([o|i]n)?\s?the "([^"]*)" project$/

Given permission_step do |user, permission, on, project| 
  create_permission(User.find_by_email!(user),
                    Project.find_by_name!(project),
                    permission)
end

def create_permission(user, object, action)
  Permission.create!(:user => user,
                     :thing => object,
                     :action => action)
end
