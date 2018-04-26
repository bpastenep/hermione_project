class RdaEspecific < ApplicationRecord
  belongs_to :rda_general
  has_many :rdae_question
  has_many :question, through: :rdae_question
end
