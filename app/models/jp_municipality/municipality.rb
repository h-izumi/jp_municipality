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

  def code_without_cd
    code[0, 5]
  end

  def code_without_prefecture_code
    code[2, 3]
  end
  alias :code_without_pref_code :code_without_prefecture_code

  def readonly?
    true
  end

  def city?
    n = code_without_pref_code.to_i
    designated_city? || (201 <= n && n <= 300)
  end

  def designated_city?
    code_without_pref_code.in?(%w{ 100 130 140 150 })
  end

  def ward?
    n = code_without_pref_code.to_i
    special_ward? || (!designated_city? && (101 <= n && n < 200))
  end

  def special_ward?
    n = code_without_cd.to_i
    (13101 <= n && n <= 13123)
  end

  def town_or_village?
    300 <= code_without_pref_code.to_i
  end

  def town?
    town_or_village? && name[-1, 1] == '町'
  end

  def village?
    town_or_village? && name[-1, 1] == '村'
  end

  def self.load_data!
    data_path = Pathname(__FILE__).join('..', '..', '..', '..', 'data', 'municipalities.csv')
    require 'csv'
    transaction do
      CSV.foreach(data_path) do |row|
        next if row[6].blank?
        m = find_or_initialize_by(code: row[0])
        m.define_singleton_method(:readonly?){ false }
        m.prefecture_code = row[0][0, 2]

        m.district_name = row[5]
        m.name = row[6]

        m.district_kana = row[2]
        m.kana = row[3]

        m.district_name_e = row[7]
        m.name_e = row[8]

        m.save! if m.changed?
      end
    end
  end
end
