class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :gist_url,
            inclusion: { in: %w(gist.github.com), message: I18n.t('.correct_url') }
end
