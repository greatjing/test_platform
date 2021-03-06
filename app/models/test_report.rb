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

  #报告属于一种类型
  belongs_to :category, :optional => true

  #状态值
  STATUS = ["draft", "public", "private"]
  #下面时状态的验证
  validates_inclusion_of :status, :in => STATUS

 #url上不显示id显示随机数
  def to_param
    #"#{self.id}-#{self.name}"
    self.friendly_id
  end

  #给添加额外的测试结果信息，:inverse_of反过来关联数据（属于ruby bug）
  has_many :testinfos, :dependent => :destroy, :inverse_of => :test_report
  #嵌套表单
  accepts_nested_attributes_for :testinfos, :allow_destroy => true, :reject_if => :all_blank


  protected

 #在新建一个test_report时就生成随机数赋值给friendly_id
  def generate_friendly_id
    #binding.pry
    self.friendly_id ||= SecureRandom.uuid
  end

end
