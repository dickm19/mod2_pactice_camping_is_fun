class Camper < ApplicationRecord
    has_many :signups
    has_many :activities, through: :signups
    validates :name, uniqueness: true
    validates :age, inclusion: { in: 8..18, message: "must be between 8 and 18"}
end
