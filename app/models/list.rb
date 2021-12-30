class List < ApplicationRecord
  has_many :list_leads, dependent: :destroy
  has_many :leads, through: :list_leads
end
