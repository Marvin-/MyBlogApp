require 'rails_helper'

RSpec.describe Statistics, type: :model do
  let(:article) { Fabricate(:article) }

  it 'is valid' do 
    expect(true).to be_truthy 
  end

  it "total articles returns a count of all the articles for the blog" do
    article_1 = Fabricate(:article)
    article_2 = Fabricate(:article)

    stats = Statistics.new
    assert_equal 2, stats.total_articles
  end

  it "total comments returns a count of all the comments for the blog" do
    article_1 = Fabricate(:article)
    article.comments.create author_name: "Commenter", body: "New Comment"

    stats = Statistics.new
    assert_equal 1, stats.total_comments
  end
end