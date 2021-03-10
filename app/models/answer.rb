class Answer < ApplicationRecord
  belongs_to :question, inverse_of: :answers

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct_answer, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:base, "you can add only 1..4 answers") if question.answers.count >= 4
  end
end
