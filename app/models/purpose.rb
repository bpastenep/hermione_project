class Purpose < ApplicationRecord
  belongs_to :rda_especific
  has_many :purpose_question, dependent: :destroy
  has_many :question, through: :purpose_question
end
