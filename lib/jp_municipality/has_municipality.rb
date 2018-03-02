module JpMunicipality
  module HasMunicipality
    extend ActiveSupport::Concern

    module ClassMethods
      def has_municipality(foreign_key = :municipality_code, options = {})
        name = options.reverse_merge({ as: :municipality })[:as]
        belongs_to name, foreign_key: foreign_key,
          class_name: 'JpMunicipality::Municipality'
      end
    end
  end
end

ActiveRecord::Base.send :include, JpMunicipality::HasMunicipality
