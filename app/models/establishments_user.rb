class EstablishmentsUser < ApplicationRecord
  belongs_to :user
  acts_as_tenant :establishment
end
