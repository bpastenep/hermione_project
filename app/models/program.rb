class Program < ApplicationRecord
	has_one :RdaGeneral
	has_many :course
end
