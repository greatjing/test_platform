class Testinfo < ApplicationRecord
  #对字段非空校验
  validates_presence_of :name, :description
  belongs_to :test_report

# 下面可以给自定义命名belongs_to的变量
#  belongs_to :abc, :class_name => "TestReport", :foreign_key => "test_report_id"

end
