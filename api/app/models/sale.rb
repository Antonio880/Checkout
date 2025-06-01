class Sale < ApplicationRecord
  belongs_to :course
  belongs_to :admin_user
end
