class Recapitulation < ActiveRecord::Base
  belongs_to :entity, polymorphic: true
  belongs_to :sub_districts, foreign_key: "sub_districts_id", class_name: "SubDistricts"
end
