class TestReport < ApplicationRecord
  validates :name, presence: true
  validates :result, presence: true
  validates :version, presence: true
end
