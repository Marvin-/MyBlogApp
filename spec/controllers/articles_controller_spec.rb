require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:article) { Fabricate(:article)}
  let(:valid_attributes) { {title: "An Exceptional Article Title"} }
  let(:valid_session) {{}}

  describe "GET #new" do
    it "is valid" do
      get :new,params: {}, session: valid_session
      expect(article).to be_truthy 
    end
    it "assigns a new article as @article" do
      get :new,params: {}, session: valid_session
      expect(article).to be_kind_of(Article)
    end
  end

 describe "GET #index" do
    it "assigns all articles as @articles" do
      article = Article.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:articles)).to eq([article])
      expect(assigns(:article_months)).to be_instance_of(Hash)
    end
  end
end
