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

  it 'is invalid without a body' do 

  end
end
