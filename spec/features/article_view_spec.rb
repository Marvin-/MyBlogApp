require 'rails_helper'

describe 'the article view', type: :feature do 
  describe 'articles' do 
    before(:each) do 
      article_1 = Fabricate(:article)
      article_2 = Fabricate(:article, :created_at =>  DateTime.new(2017, 2))
      visit(root_path)
    end

    it '#index displays all articles' do 
      expect(page).to have_text("MyString")
    end

    it 'displays links of articles by month' do 
      expect(page).to have_link("March", href:  articles_month_path('March'))
      expect(page).to have_link("February", href:  articles_month_path('February'))
    end

    context 'when month is clicked' do 
      it 'shows only articles of that month' do
        click_link('March')
        expect(current_url).to include "/March"
        expect(current_url).not_to include "/February"
      end
    end
  end
end