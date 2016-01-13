class SubDistricts < ActiveRecord::Base
    has_many :recapitulations, foreign_key: "sub_districts_id"
end
