class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def is_admin?
    is_admin
  end

  has_many :memberships
  has_many :groups, :through => :memberships

  #用户属性
  has_one :profile

end
