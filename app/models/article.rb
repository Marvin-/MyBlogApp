class Article < ApplicationRecord
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :title, :body, presence: true

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tag_string)
    tag_names = tag_string.split(",").collect {|s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end

  def self.by_month
    Article.all.group_by{ |r| r.created_at.strftime("%B")}
  end

  def self.three_most_viewed
    Article.order("view_count DESC")[0..2]
  end

  def increment_view
    self.view_count += 1
  end
end
