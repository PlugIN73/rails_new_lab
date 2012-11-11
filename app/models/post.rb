class Post < ActiveRecord::Base
  attr_accessible :body, :description, :published_at, :title
  validates :title, :presence => true

  state_machine initial: :new do
    event :accept do
      transition [:new, :rejected] => :accepted
    end

    event :reject do
      transition :new => :rejected
    end

    event :start do
      transition :accepted => :started
    end

    event :finish do
      transition :started => :finished
    end
  end
end
