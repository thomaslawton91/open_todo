class List < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :items, dependent: :destroy

  validates_presence_of :name
end
