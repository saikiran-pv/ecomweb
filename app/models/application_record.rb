class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def is_admin?
    super_admin? || store_admin? || staff?
  end
end


# if current_user.super_admin?

# elsif current_user.store_admin?

# elsif current_user.staff?

# end