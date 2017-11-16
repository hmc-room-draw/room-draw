class Email < ApplicationRecord
  attribute :subject,   validate: true
  attribute :description, validate: true
  attribute :send_date
end
