class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def is_admin?
    super_admin? || store_admin? || staff?
  end
end
