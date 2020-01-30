# frozen_string_literal: true

class Contact < ApplicationRecord
  has_many :social_accounts
end
