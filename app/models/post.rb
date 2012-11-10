class Post < ActiveRecord::Base
  attr_accessible :body, :description, :published_at, :title
  validates :title, :presence => true
end
