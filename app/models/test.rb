class Test < ApplicationRecord
  def self.titles_by_category(title)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.title = :title ', title: title)
        .order(title: :desc)
        .pluck(:title)
  end
end
