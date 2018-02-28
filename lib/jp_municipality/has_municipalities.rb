module JpMunicipality
  module HasMunicipalities
    extend ActiveSupport::Concern

    def municipalities
      JpMunicipality::Municipality.by_prefecture(self)
    end
  end
end

JpPrefecture::Prefecture.send :include, JpMunicipality::HasMunicipalities
