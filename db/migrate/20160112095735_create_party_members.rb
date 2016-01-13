class CreatePartyMembers < ActiveRecord::Migration
  def change
    create_table :party_members do |t|
      t.references :party
      t.string :name
    end
    add_index :party_members, :party_id
  end
end
