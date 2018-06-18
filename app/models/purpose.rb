class Purpose < ApplicationRecord
  belongs_to :rda_especific
  has_many :question, dependent: :destroy
end
