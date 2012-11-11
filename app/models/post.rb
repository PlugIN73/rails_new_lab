class Post < ActiveRecord::Base
  attr_accessible :body, :description, :published_at, :title
  validates :title, :presence => true

  state_machine initial: :unpublished do
    event :unpublish do
      transition all => :unpublished
    end

    event :publish do
      transition all => :published
    end

    event :delete do
      transition all => :deleted
    end
  end
end
