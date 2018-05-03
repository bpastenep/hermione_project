class Evaluation < ApplicationRecord
	has_many :evaluation_question
	has_many :question, :through :evaluation_question
end
