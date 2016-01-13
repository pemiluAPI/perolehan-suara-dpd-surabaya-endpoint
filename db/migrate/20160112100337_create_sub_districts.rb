class CreateSubDistricts < ActiveRecord::Migration
  def change
    create_table :sub_districts do |t|
      t.string :name
    end
  end
end
