class Question < ApplicationRecord
  	belongs_to :purpose, dependent: :destroy
  	has_many :evaluation_question, dependent: :destroy
  	has_many :question, through: :evaluation_question, dependent: :destroy
  	has_many :answer

  	has_attached_file :imagen, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\z/
end
