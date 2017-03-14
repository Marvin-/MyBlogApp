require 'rails_helper'

RSpec.describe Statistics, type: :model do
  let(:article) { Fabricate(:article) }
  let(:article_1) { Fabricate(:article) }

  before(:each) do 
    article.comments.create author_name: "Commenter", body: "New Comment"
    article.comments.create author_name: "Commenter", body: "Second Comment"
    article_1.comments.create author_name: "James", body: "James' Comment"
  end

  it 'is valid' do 
    expect(true).to be_truthy 
  end

  it "returns a count of all the articles for the blog with total articles" do
    stats = Statistics.new
    expect(stats.total_articles).to eq 2
  end

  it "returns a count of all the comments for the blog total comments" do
    stats = Statistics.new
    expect(stats.total_comments).to eq 3
  end

  it "returns article with most comments as most popular" do 
    stats = Statistics.new
    expect(stats.most_popular).to match article
  end
end