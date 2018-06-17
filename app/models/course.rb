class Course < ApplicationRecord
	has_many :course_evaluation, dependent: :destroy
	has_many :evaluation, through: :course_evaluation, dependent: :destroy
	has_many :course_user, dependent: :destroy
	has_many :user, through: :course_user, dependent: :destroy
	belongs_to :program
end
