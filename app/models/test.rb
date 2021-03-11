class Test < ApplicationRecord
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard, 4 => :hero }.freeze

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :results
  has_many :users, through: :results

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level, message: "title with this level already exists" }

  scope :easy, -> { where(level: 0) }
  scope :elementary, -> { where(level: 1) }
  scope :advanced, -> { where(level: 2) }
  scope :hard, -> { where(level: 3) }
  scope :hero, -> { where(level: (4..Float::INFINITY)) }

  scope :with_level, ->(level) { where(level: level) }

  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }) }

  def self.titles_by_category(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end
