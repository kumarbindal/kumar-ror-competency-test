class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :role, optional: false

  has_many :articles, dependent: :destroy

  validates :name, presence: true

  def admin?
    role.name == 'Admin'
  end

  def editor?
    role.name == 'Editor'
  end

  def vanila_user?
    role.name == 'User'
  end
end
