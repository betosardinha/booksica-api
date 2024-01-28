# frozen_string_literal: true

class CreateEditions < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/MethodLength
    create_table :editions do |t|
      t.uuid :uuid, null: false, default: 'gen_random_uuid()'
      t.string :isbn, null: false, limit: 13
      t.string :format, null: false, limit: 10
      t.text :description, limit: 500
      t.integer :year, null: false
      t.integer :pages
      t.integer :book_id, null: false
      t.integer :publisher_id, null: false
      t.jsonb :metadata, null: false, default: {}
      t.timestamps
    end

    add_foreign_key :editions, :books, on_delete: :cascade
    add_foreign_key :editions, :publishers, on_delete: :cascade

    add_index :editions, :uuid, unique: true
    add_index :editions, %i[isbn format], unique: true, name: 'index_editions_on_isbn_and_format'
  end
end
