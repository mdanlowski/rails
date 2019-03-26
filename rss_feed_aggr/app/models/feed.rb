class Feed < ApplicationRecord
  has_many :entries, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true

  validates :update_interval, presence: true, numericality: {
    only_integer: true,
    greater_than: 0,
  }

  validates :keep_n_last, numericality: {
    only_integer: true,
    greater_than: 0,
    less_than: 20
  }
end
