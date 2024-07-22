class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :name, null: false
      t.text :description
      t.references :team_lead, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end

    add_index :teams, :name, unique: true
  end
end
