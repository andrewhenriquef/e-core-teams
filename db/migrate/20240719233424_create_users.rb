class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :users, :name, unique: true
  end
end
