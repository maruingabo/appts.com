class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :establishments_users
  acts_as_tenant :establishment, through: :establishments_users

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
end
