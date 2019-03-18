class Feed < ApplicationRecord
  has_many :entries, dependent: :destroy

  validates :keep_n_last, numericality: {
    only_integer: true,
    greater_than: 0,
    less_than: 20
  }
end
