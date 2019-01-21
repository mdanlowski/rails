class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 2, maximum: 110 }
  validates :body, presence: true

end
