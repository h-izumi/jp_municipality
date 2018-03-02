class JpMunicipality::Municipality < ActiveRecord::Base
  self.table_name = 'municipalities'

  include JpPrefecture
  jp_prefecture :prefecture_code

  alias_attribute :name_k, :kana

  default_scope { order(:code) }

  scope :by_prefecture, ->(prefecture) {
    prefecture = prefecture.to_i if prefecture.is_a?(String)
    code =
      case prefecture
      when JpPrefecture::Prefecture
        '%02d' % prefecture.code
      when Integer
        '%02d' % prefecture
      else
        prefecture
      end
    by_prefecture_code(code)
  }

  scope :by_prefecture_code, ->(prefecture_code) {
    where(prefecture_code: prefecture_code)
  }

  def readonly?
    true
  end

  def self.load_data!
    data_path = Pathname(__FILE__).join('..', '..', '..', '..', 'data', 'municipalities.csv')
    require 'csv'
    require 'nkf'
    transaction do
      CSV.foreach(data_path) do |row|
        next if row[2].blank?
        m = find_or_initialize_by(code: row[0])
        m.define_singleton_method(:readonly?){ false }
        m.prefecture_code = row[0][0, 2]
        m.name = row[2]
        m.kana = row[4].present? ? NKF.nkf('-Xww', row[4]) : nil
        m.save! if m.changed?
      end
    end
  end
end