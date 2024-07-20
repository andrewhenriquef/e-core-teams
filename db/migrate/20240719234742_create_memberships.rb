class CreateMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :team, null: false, foreign_key: true, type: :uuid
      t.references :role, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :memberships, %i[user_id team_id role_id], unique: true
  end
end
