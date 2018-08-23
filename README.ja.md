# JpMunicipality
全国地方公共団体コード(市区町村コード) for Rails

全国地方公共団体コードのうち、市区町村コードの範囲(JIS X 0402)をRuby on Rails上で扱いやすくすることを目的としています。
アプリケーションへ市区町村テーブル(`municipalities`)を追加し、このテーブルを参照するActiveRecordモデル`JpMunicipality::Municipality`を提供します。

また、[JpPrefecture](https://github.com/chocoby/jp_prefecture)により都道府県情報を参照できます。

## 使い方

### 全国地方公共団体コードを指定して市区町村を取得

```
JpMunicipility::Municipality.find("465291")
# => #<JpMunicipality::Municipality:0x000055e545d8b028> {
               :code => "465291",
    :prefecture_code => "46",
               :name => "喜界町",
               :kana => "キカイチョウ"
}
```

### 都道府県コードを指定して市区町村の配列を取得

```
JpMunicipality::Municipality.by_prefecture_code("46")
# => [
    [ 0] #<JpMunicipality::Municipality:0x000055e546941d68> {
                   :code => "462012",
        :prefecture_code => "46",
                   :name => "鹿児島市",
                   :kana => "カゴシマシ"
    },
    [ 1] #<JpMunicipality::Municipality:0x000055e5469402d8> {
                   :code => "462039",
        :prefecture_code => "46",
                   :name => "鹿屋市",
                   :kana => "カノヤシ"
    },
    # ...
]
```

### 関連として参照

```
class User < ApplicationRecord
  has_municipality
  # has_municipality :municipality_code # foreign_keyを指定
  # has_municipality :municipality_code, as: :city # 関連名を指定
end
```

```
> user.municipality_code = 131016

> user.municipality
# =>
#<JpMunicipality::Municipality:0x0000565271a105d0> {
               :code => "131016",
    :prefecture_code => "13",
               :name => "千代田区",
               :kana => "チヨダク"
}

# `as: 関連名`を指定した場合
> user.city
# =>
#<JpMunicipality::Municipality:0x0000565271a105d0> {
               :code => "131016",
    :prefecture_code => "13",
               :name => "千代田区",
               :kana => "チヨダク"
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
本プログラムで使用しているデータ(municipalities.csv)は、[「都道府県コード及び市区町村コード(平成28年10月10日現在）_Excel](http://www.data.go.jp/data/dataset/soumu_20140909_0395/resource/dff2cb46-a11e-4879-b5d9-6c4776114e9a)を加工したものです。
