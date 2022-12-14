class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expenses, through: :group_expenses
  has_many :group_expenses, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
  validates :author_id, presence: true
end
