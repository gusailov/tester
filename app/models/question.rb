class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :gists

  validates :body, presence: true,
                   uniqueness: { scope: :test_id, message: I18n.t('.question_exist') }
end
