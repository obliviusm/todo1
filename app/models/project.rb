class Project < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
