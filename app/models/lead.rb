class Lead < ApplicationRecord
    has_many :list_leads, dependent: :destroy
    has_many :lists, through: :list_leads
end
