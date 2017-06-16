class Item < ApplicationRecord
  belongs_to :list, dependent: :destroy
  validates_presence_of :todo
end
