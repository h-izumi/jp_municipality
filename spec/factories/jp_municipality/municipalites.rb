FactoryBot.define do
  factory :municipality, aliases: [:kagoshimashi], class: JpMunicipality::Municipality do
    code { '462012' }
    prefecture_code { '46' }
    district_name { '' }
    name { '鹿児島市' }
    district_kana { '' }
    kana { 'カゴシマシ' }
    district_name_e { '' }
    name_e { 'KAGOSHIMA SHI' }

    factory :kikaicho do
      code { '465291' }
      prefecture_code { '46' }
      district_name { '大島郡' }
      name { '喜界町' }
      district_kana { 'オオシマグン' }
      kana { 'キカイチョウ' }
      district_name_e { 'OSHIMA GUN' }
      name_e { 'KIKAI CHO' }
    end

    factory :chiyodaku do
      code { '131016' }
      prefecture_code { '13' }
      name { '千代田区' }
      kana { 'チヨダク' }
      name_e { 'CHIYODA KU' }
    end

    factory :ukenson do
      code { '465241' }
      prefecture_code { '46' }
      district_name { '大島郡' }
      name { '宇検村' }
      district_kana { 'オオシマグン' }
      kana { 'ウケンソン' }
      district_name_e { 'OSHIMA GUN' }
      name_e { 'UKEN SON' }
    end

    factory :fukuokashi do
      code { '401307' }
      prefecture_code { '40' }
      name { '福岡市' }
      kana { 'フクオカシ' }
      name_e { 'FUKUOKA SHI' }
    end

    factory :fukuokashi_hakataku do
      code { '401323' }
      prefecture_code { '40' }
      district_name { '福岡市' }
      name { '博多区' }
      district_kana { 'フクオカシ' }
      kana { 'ハカタク' }
      district_name_e { 'FUKUOKA SHI' }
      name_e { 'HAKATA KU' }
    end
  end
end
