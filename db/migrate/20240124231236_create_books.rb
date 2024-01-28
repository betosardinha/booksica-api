# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :books do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()'
      t.string :title, null: false, limit: 50
      t.string :subtitle, limit: 100
      t.string :book_type, null: false, limit: 10
      t.integer :parent_id
      t.jsonb :metadata, null: false, default: {}
      t.timestamps
    end

    add_foreign_key :books, :books, column: :parent_id, on_delete: :cascade

    add_index :books, :uuid, unique: true
  end
end
