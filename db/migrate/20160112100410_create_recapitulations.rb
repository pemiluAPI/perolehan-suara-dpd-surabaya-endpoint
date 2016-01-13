class CreateRecapitulations < ActiveRecord::Migration
  def change
    create_table :recapitulations do |t|
      t.references :entity, polymorphic: true, index: true
      t.references :sub_districts
      t.string :voice
      t.string :description
    end
    add_index :recapitulations, :entity_id
    add_index :recapitulations, :entity_type
    add_index :recapitulations, :sub_districts_id
  end
end
