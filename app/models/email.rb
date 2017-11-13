class Email < ApplicationRecord
  attribute :subject,   validate: true
  attribute :message
end
