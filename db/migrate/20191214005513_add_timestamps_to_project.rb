# frozen_string_literal: true
class AddTimestampsToProject < ActiveRecord::Migration[5.2]
  def change
    change_table :projects do |t|
      t.timestamps
    end
  end
end
