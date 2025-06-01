class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.references :course, null: false, foreign_key: true
      t.references :admin_user, null: false, foreign_key: true
      t.integer :amount_cents

      t.timestamps
    end
  end
end
