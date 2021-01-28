class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :barbers, through: :reviews
end