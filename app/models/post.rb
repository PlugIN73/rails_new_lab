class Post < ActiveRecord::Base
  attr_accessible :body, :description, :published_at, :title
  validates :title, :presence => true

  state_machine initial: :unpublished do
    event :unpublish do
      transition [:publish, :delete] => :unpublished
    end

    event :publish do
      transition [:unpublish, :delete] => :published
    end

    event :delete do
      transition [:publish, :unpublish] => :deleted
    end
  end
end
