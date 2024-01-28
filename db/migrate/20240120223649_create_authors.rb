# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()'
      t.string :name, null: false, limit: 100
      t.jsonb :metadata, null: false, default: {}
      t.timestamps
    end

    add_index :authors, :uuid, unique: true
  end
end
