class Test < ApplicationRecord
  belongs_to :category

  def self.tests_by_category(category_title)
    category = Category.find_by title: category_title
    category_id = category.id
    Test.select(:title).where(category_id: category_id).order(title: :desc)
  end
end
