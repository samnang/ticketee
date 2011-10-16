class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :state

  has_many :comments
  has_many :assets
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :watchers, :join_table => "ticket_watchers",
                                     :class_name => "User"

  accepts_nested_attributes_for :assets

  validates :title, :presence => true
  validates :description, :presence => true, :length => {:minimum => 10}

  after_create :creator_watches_me

  searcher do
    label :tag,  :from => :tags, :field => :name
    label :state, :from => :state, :field => :name
  end

  def tag!(tags)
    tags = tags.split(" ").map do |tag|
      Tag.find_or_create_by_name(tag)
    end

    self.tags << tags
  end

  def creator_watches_me
    self.watchers << self.user
  end
end
