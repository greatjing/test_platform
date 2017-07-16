class Testinfo < ApplicationRecord
  #对字段非空校验
  validates_presence_of :name, :description
  belongs_to :test_report
end
