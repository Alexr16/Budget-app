class User < ApplicationRecord
    has_many :entitys, dependent: :destroy, foreign_key: 'author_id'
    has_many :expenses, dependent: :destroy, foreign_key: 'author_id'

    validates :name, presence: true
end
