class Property < ApplicationRecord
  has_many :nearests, dependent: :destroy
  accepts_nested_attributes_for :nearests, allow_destroy: true, reject_if: :all_blank
end
