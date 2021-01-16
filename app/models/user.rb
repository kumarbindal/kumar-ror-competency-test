class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role, optional: true
  has_many :articles, dependent: :destroy
  validates :name, presence: true
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'User' if role.nil?
  end

  # check user role is admin or not
  def admin?
    role.name == 'Admin'
  end

  # check user role is editor or not
  def editor?
    role.name == 'Editor'
  end

  # check user role is vanilla user or not
  def vanila_user?
    role.name == 'User'
  end
end
