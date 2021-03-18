class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}
  # validates :email, presence: true, length: {maximum: 255}
  # validates :email, uniqueness: true
  # validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Товарисч №#{rand(781)}" if self.name.blank?
  end
end
