class Training < ApplicationRecord
  has_many :user_trainings
  has_many :users, through: :user_trainings
end
