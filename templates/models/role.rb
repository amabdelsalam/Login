class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  def candidate_users
    User.find(:all, :order => "username ASC")
  end
  
  def enrolled?(user)
    users.include?(user)
  end
end
