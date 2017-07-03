class TestReport < ApplicationRecord
  validates :name, presence: true
  validates :result, presence: true
  validates :version, presence: true
  #必填字段
  validates_presence_of :friendly_id
  #唯一字段
  validates_uniqueness_of :friendly_id
  #格式限制，只能时小写英文数字以及横线
  validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

  before_validation :generate_friendly_id, :on => :create

 #url上不显示id显示随机数
  def to_param
    #"#{self.id}-#{self.name}"
    self.friendly_id
  end

  protected

 #在新建一个test_report时就生成随机数赋值给friendly_id
  def generate_friendly_id
    #binding.pry
    self.friendly_id ||= SecureRandom.uuid
  end

end
