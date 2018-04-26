class Question < ApplicationRecord
	has_many :purpose_question
  	has_many :purpose, through: :purpose_question
end
