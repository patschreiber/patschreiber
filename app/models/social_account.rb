# frozen_string_literal: true

class SocialAccount < ApplicationRecord
  belongs_to :contact, optional: true
end
