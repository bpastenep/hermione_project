class CourseEvaluation < ApplicationRecord
	belongs_to :evaluation
	belongs_to :course
end
