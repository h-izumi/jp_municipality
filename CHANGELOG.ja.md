## 0.4.0 ##
* *行政区の名前パターンを変更*
  * 例: `{ district_name: '', name: '福岡市博多区' }` -> `{ district_name: '福岡市', name: '博多区' }`
* JpPrefecture風のメソッドを追加
  * 例: `name_h`

## 0.3.1 ##
* 種類判定用メソッドを追加
  * `city?`, `designated_city?`, `ward?`, `special_ward?`, `town?`, `village?`

## 0.3.0 ##
* **テーブルスキーマ変更**
* データ更新
  * 郡 を追加
  * ローマ字表記 を追加
  * 政令指定都市の行政区 を追加

## 0.2.0 ##
* `has_municipality`: `optional: true`をデフォルト設定

## 0.1.0 ##
* 初期リリース
