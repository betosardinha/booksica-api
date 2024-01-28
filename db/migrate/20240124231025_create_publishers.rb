# frozen_string_literal: true

class CreatePublishers < ActiveRecord::Migration[7.1]
  def change
    create_table :publishers do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()'
      t.string :name, null: false, limit: 100
      t.jsonb :metadata, null: false, default: {}
      t.timestamps
    end

    add_index :publishers, :uuid, unique: true
  end
end
