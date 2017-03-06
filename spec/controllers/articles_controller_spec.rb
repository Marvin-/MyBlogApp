require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:article) { Fabricate(:article)}
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
end
