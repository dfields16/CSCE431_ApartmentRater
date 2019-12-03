class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :apartment, index:true, foreign_key:true
      t.references :user, index:true, foreign_key:true
      t.text :review_text
      t.decimal :price, :default => 0.00
      t.timestamps
    end

    add_foreign_key :reviews, :apartments, on_delete: :cascade
    add_foreign_key :reviews, :users, on_delete: :cascade
  end
end
