class Folder < ApplicationRecord
  belongs_to :user
  has_many :paragraphs, dependent: :destroy
  validates :name, presence: :true
end
