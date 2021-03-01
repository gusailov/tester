class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :results
  has_many :users, through: :results

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy_level, -> { where(level: (0..1)) }
  scope :medium_level, -> { where(level: (2..4)) }
  scope :difficult_level, -> { where(level: (5..Float::INFINITY)) }

  scope :with_level, ->(level) { where(level: level) }

  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }) }

  def self.titles_by_category(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end
