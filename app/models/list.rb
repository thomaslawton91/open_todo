class List < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :items

  validates_presence_of :name
end
