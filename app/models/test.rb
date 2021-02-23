class Test < ApplicationRecord
  
  def self.tests_by_category(category_title)
    category = Category.find_by title: category_title
    Test.select(:title).where(category_id: category.id).order(title: :desc)
  end
end
