class Purpose < ApplicationRecord
  belongs_to :rda_especific
  has_many :purpose_question, dependent: :delete_all
  has_many :question, through: :purpose_question
end
