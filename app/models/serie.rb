class Serie < ApplicationRecord
  has_many :rentals, as: :rentable
  has_many :episodes
  enum status: ["billboard", "preorder", "coming-soon" ]
end
