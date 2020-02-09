# frozen_string_literal: true

class SocialAccount < ApplicationRecord
  belongs_to :contact, optional: true

  scope :contacts_list, -> { select(:id, :service_name, :profile_url) }
  scope :viewable, -> { where(account_active: true, display_account: true) }
  scope :grouped, -> { group(:service_name, :service_tld) }
  scope :ordered, -> { order(service_name: :asc) }
end
