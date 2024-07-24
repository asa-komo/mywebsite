# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, presence: true,length: {minimum: 3}
    validates :body, presence: true
end
