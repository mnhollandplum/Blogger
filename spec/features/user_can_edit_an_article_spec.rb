require 'rails_helper'

describe "user edits an article" do
  describe "they link from the articles show page" do
    describe "they fill in the title and body" do
      it "edits article" do
        article_1 = Article.create(title: "New Article", body: "Hopefully this no longer says this")

        visit article_path(article_1.id)
        click_link "Edit Article"

        expect(current_path).to eq(edit_article_path(article_1.id))

        fill_in "article[title]", with: "Edited Title!"
        fill_in "article[body]", with: "Edited Body"
        click_on "Update Article"

        expect(page).to have_content("Edited Title!")
        expect(page).to have_content("Edited Body")
      end
    end
  end
end
