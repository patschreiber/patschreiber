# frozen_string_literal: true

class CreateSocialAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :social_accounts do |t|
      t.belongs_to :contact
      t.string :service_name
      t.string :handle
      t.string :service_tld
      t.string :profile_url
      t.date :date_joined
      t.boolean :account_active
      t.boolean :display_account

      t.timestamps
    end
  end
end
