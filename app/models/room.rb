class Room < ApplicationRecord
  has_many :users, dependent: :destroy
end
