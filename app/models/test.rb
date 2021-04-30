class Test < ApplicationRecord
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard, 4 => :hero }.freeze

  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :with_level, ->(level) { where(level: level) }

  scope :easy, -> { with_level(0) }
  scope :elementary, -> { with_level(1) }
  scope :advanced, -> { with_level(2) }
  scope :hard, -> { with_level(3) }
  scope :hero, -> { with_level(4..Float::INFINITY) }

  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }) }

   def self.titles_by_category(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end
