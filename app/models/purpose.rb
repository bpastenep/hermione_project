class Purpose < ApplicationRecord
  belongs_to :rda_especific
  has_many :purpose_question
  has_many :question, through: :purpose_question
end
