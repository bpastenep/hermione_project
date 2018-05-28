class Evaluation < ApplicationRecord
	has_many :evaluation_question, dependent: :destroy
	has_many :question, through: :evaluation_question, dependent: :destroy
	has_many :course_evaluation, dependent: :destroy
	has_many :course, through: :course_evaluation, dependent: :destroy
end
