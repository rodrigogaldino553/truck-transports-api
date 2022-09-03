class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :payload_name
      t.integer :payload_size
      t.float :total_billing
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
