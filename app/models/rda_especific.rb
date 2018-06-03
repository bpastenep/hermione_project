class RdaEspecific < ApplicationRecord
  belongs_to :rda_general
  has_many :purpose, dependent: :destroy
end
