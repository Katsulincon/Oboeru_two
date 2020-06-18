class Paragraph < ApplicationRecord
  belongs_to :folder
  has_many :blanks, dependent: :destroy
end
