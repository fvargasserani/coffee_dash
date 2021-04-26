class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :blend_name
      t.string :origin
      t.datetime :date
      t.float :amount

      t.timestamps
    end
  end
end
