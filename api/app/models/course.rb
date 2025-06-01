class Course < ApplicationRecord
    # has_many :sales
    # has_many :admin_users, through: :sales

    validates :title, :price_cents, presence: true
end
