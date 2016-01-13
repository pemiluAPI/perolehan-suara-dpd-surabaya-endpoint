module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :penghitungan_sah do
      desc "Return all Penghitungan Sah Calon Anggota DPD"
      get do
        recapitulations = Array.new

        # Prepare conditions based on params
        valid_params = {
          id: 'id',
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        Candidate.includes(:recapitulations)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |data|
            recapitulations << {
              id: data.id,
              nama: data.name,
              rekapitulasi: data.get_recapitulations
            }
          end

        {
          results: {
            count: recapitulations.count,
            total: Candidate.where(conditions).count,
            penghitungan_sah: recapitulations
          }
        }
      end
    end

    resource :perolehan_suara_partai do
      desc "Return all Rekapitulasi perolehan suara partai"
      get do
        recapitulations = Array.new

        # Prepare conditions based on params
        valid_params = {
          id: 'id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        Party.includes(:recapitulations)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |data|
            recapitulations << {
              id: data.id,
              nama: data.name,
              rekapitulasi: data.get_recapitulations
            }
          end

        {
          results: {
            count: recapitulations.count,
            total: Party.where(conditions).count,
            penghitungan_sah: recapitulations
          }
        }
      end
    end

    resource :perolehan_suara_anggota_partai do
      desc "Return all Rekapitulasi perolehan suara anggota partai"
      get do
        recapitulations = Array.new

        # Prepare conditions based on params
        valid_params = {
          id: 'id'
        }
        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        limit = (params[:limit].to_i == 0 || params[:limit].empty?) ? 10 : params[:limit]

        PartyMember.includes(:recapitulations)
          .where(conditions)
          .limit(limit)
          .offset(params[:offset])
          .each do |data|
            recapitulations << {
              id: data.id,
              nama: data.name,
              rekapitulasi: data.get_recapitulations
            }
          end

        {
          results: {
            count: recapitulations.count,
            total: PartyMember.where(conditions).count,
            penghitungan_sah: recapitulations
          }
        }
      end
    end
  end
end