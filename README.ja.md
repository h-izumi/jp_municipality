# JpMunicipality
全国地方公共団体コード(市区町村コード) for Rails

全国地方公共団体コードのうち、市区町村コードの範囲(JIS X 0402)をRuby on Rails上で扱いやすくすることを目的としています。
アプリケーションへ市区町村テーブル(`municipalities`)を追加し、このテーブルを参照するActiveRecordモデル`JpMunicipality::Municipality`を提供します。

また、[JpPrefecture](https://github.com/chocoby/jp_prefecture)により都道府県情報を参照できます。

## 使い方

### 全国地方公共団体コードを指定して市区町村を取得

```ruby
JpMunicipility::Municipality.find("465291")
# => #<JpMunicipality::Municipality> {
               :code => "465291",
    :prefecture_code => "46",
      :district_name => "大島郡",
               :name => "喜界町",
      :district_kana => "オオシマグン",
               :kana => "キカイチョウ",
    :district_name_e => "OSHIMA GUN",
             :name_e => "KIKAI CHO"
}
```

### 都道府県コードを指定して市区町村の配列を取得

```ruby
JpMunicipality::Municipality.by_prefecture_code("46")
# => [
    [ 0] #<JpMunicipality::Municipality> {
                   :code => "462012",
        :prefecture_code => "46",
          :district_name => "",
                   :name => "鹿児島市",
          :district_kana => "",
                   :kana => "カゴシマシ",
        :district_name_e => "",
                 :name_e => "KAGOSHIMA SHI"
    },
    [ 1] #<JpMunicipality::Municipality> {
                   :code => "462039",
        :prefecture_code => "46",
          :district_name => "",
                   :name => "鹿屋市",
          :district_kana => "",
                   :kana => "カノヤシ",
        :district_name_e => "",
                 :name_e => "KANOYA SHI"
    },
    # ...
]
```

### 関連として参照

```ruby
class User < ApplicationRecord
  has_municipality
  # has_municipality :municipality_code # foreign_keyを指定
  # has_municipality :municipality_code, as: :city # 関連名を指定
end
```

```ruby
> user.municipality_code = 131016

> user.municipality
# =>
#<JpMunicipality::Municipality> {
               :code => "131016",
    :prefecture_code => "13",
      :district_name => "",
               :name => "千代田区",
      :district_kana => "",
               :kana => "チヨダク",
    :district_name_e => "",
             :name_e => "CHIYODA KU"
}

# `as: 関連名`を指定した場合
> user.city
# =>
#<JpMunicipality::Municipality> {
               :code => "131016",
    :prefecture_code => "13",
      :district_name => "",
               :name => "千代田区",
      :district_kana => "",
               :kana => "チヨダク",
    :district_name_e => "",
             :name_e => "CHIYODA KU"
}
```

## インストール

以下の行を`Gemfile`に記述し、`bundle`してください。

```
gem 'jp_municipality'
```

### アップデート

バージョン0.3.0より、郡、郡(ローマ字)、名前(ローマ字)カラムが追加されました。
バージョン0.2.0以前からアップデートする際は、以前のマイグレーションファイルをロールバック、削除した上で再度「テーブルの追加」以降の手順を実施してください。

### テーブルの追加

以下のコマンドを実行すると、マイグレーションファイルがアプリケーションの`db/migrations`へコピーされます。

```
$ bin/rails jp_municipality:install:migrations
```

その後、`bin/rails db:migrate`してください。

### データ登録

以下のコマンドを実行すると、テーブルに市区町村情報が登録されます。

```
$ bin/rails jp_municipality:load_data
```

## 出典
本プログラムで使用しているデータ(municipalities.csv)は、以下のデータを加工・合成・補修したものです。
* [「都道府県コード及び市区町村コード」(平成28年10月10日現在)](http://www.soumu.go.jp/main_content/000562730.xls)
* [郵便番号データ](https://www.post.japanpost.jp/zipcode/download.html)
  * 住所の郵便番号(CSV形式) 読み仮名データの促音・拗音を小書きで表記するもの 2018年7月31日更新版
  * 住所の郵便番号(ローマ字)(CSV形式) 2018年6月21日更新版
