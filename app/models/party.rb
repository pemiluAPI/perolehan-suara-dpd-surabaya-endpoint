class Party < ActiveRecord::Base
  has_many :recapitulations, as: :entity

  def get_recapitulations
    recapitulations = []

    self.recapitulations.map{|data|
      recapitulations << {
        kecamatan: data.sub_districts.name,
        suara: data.voice
      }
    }

    return recapitulations
  end
end
