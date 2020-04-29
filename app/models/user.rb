class User < ActiveRecord::Base
  has_many :comments
  has_many :posts, through: :comments
  # accepts_nested_attributes_for :comments, reject_if: proc { |attributes| attributes['content'].blank? }


  def users_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      if !user_attribute[:username].empty?
        user = User.find_or_create_by(user_attribute)
        self.users << user
      end
    end
  end
end
