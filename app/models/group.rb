class Group < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :expenses, dependent: :destroy
    has_many :group_expenses, dependent: :destroy

    validates :name, presence: true
end
