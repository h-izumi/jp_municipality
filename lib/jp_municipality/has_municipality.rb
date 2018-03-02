module JpMunicipality
  module HasMunicipality
    extend ActiveSupport::Concern

    module ClassMethods
      def has_municipality(foreign_key = :municipality_code, options = {})
        options.reverse_merge!({
          as: :municipality,
          optional: true,
        })
        belongs_to options[:as], foreign_key: foreign_key, optional: options[:optional],
          class_name: 'JpMunicipality::Municipality'
      end
    end
  end
end

ActiveRecord::Base.send :include, JpMunicipality::HasMunicipality
