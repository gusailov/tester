class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :results
  has_many :users, through: :results

  scope :easy_level, -> { where(level: (0..1)) }
  scope :medium_level, -> { where(level: (2..4)) }
  scope :difficult_level, -> { where(level: (5..Float::INFINITY)) }

  scope :with_level, ->(level) { where(level: level) }

  scope :titles_by_category, lambda { |title|
                               Test.joins(:category).where(categories: { title: title })
                                   .order(title: :desc).pluck(:title)
                             }
end
