class Evaluation < ApplicationRecord
	has_many :evaluation_question, dependent: :destroy
	has_many :question, through: :evaluation_question, dependent: :destroy
	belongs_to :course, dependent: :destroy
end
