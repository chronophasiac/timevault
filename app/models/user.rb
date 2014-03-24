class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pomodoros,
           inverse_of: :user,
           dependent: :destroy
           
  validates :phone_number, presence: true
end
