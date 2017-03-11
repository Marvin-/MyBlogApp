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
end
