# frozen_string_literal: true

class CreateBookAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :book_authors do |t|
      t.integer :book_id, null: false
      t.integer :author_id, null: false
      t.timestamps
    end

    add_foreign_key :book_authors, :books, on_delete: :cascade
    add_foreign_key :book_authors, :authors, on_delete: :cascade

    add_index :book_authors, %i[book_id author_id], unique: true
  end
end
