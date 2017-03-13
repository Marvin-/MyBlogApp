require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { Fabricate(:article)}

  let(:valid_attributes) {{title: "Test Title"}}
  let(:invalid_attributes) { {} }
  
  it 'is valid' do 
    expect(article).to be_valid
  end

  it 'is invalid without a title' do 
    article.title = nil
    expect(article).to_not be_valid
  end 

  context 'gets articles sorted by month created' do

    it 'should have a by_month method' do 
      expect(Article).to respond_to(:by_month)
    end

    it 'should return a hash' do 
      expect(Article.by_month).to be_kind_of(Hash)
    end

    it 'should have months as keys' do 
      article_1 = Fabricate(:article, :created_at => Time.mktime(2017, 1))
      article_2 = Fabricate(:article, :created_at => Time.mktime(2017, 2))
      months = Article.by_month
      expect(months.keys).to include("February")
    end 
  end
  it 'has a view count column' do 
    expect(Article).to have_attribute(:view_count)
  end
  it 'has an increment_view method' do 
    expect(article).to respond_to(:increment_view)
  end

  it 'increments the article view count when clicked' do 
    expect(article.view_count).to eq 0
    article.increment_view
    expect(article.view_count).to eq 1
  end
end
