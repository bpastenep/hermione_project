class Question < ApplicationRecord
	has_many :rdae_question
  	has_many :rda_especific, through: :rdae_question
end
