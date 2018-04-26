class RdaGeneral < ApplicationRecord
	has_one :program, :through => :program_id
	has_many :rda_especific
end
