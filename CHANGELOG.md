## 0.4.1 ##
* Fix data.
  * wards of Sendai and Sagamihara

## 0.4.0 ##
* *Change pattern of ward's name*
  * e.g. `{ district_name_e: '', name_e: 'FUKUOKA SHI HAKATA KU'}` -> `{ district_name_e: 'FUKUOKA SHI', name_e: 'HAKATA KU' }`
* Add JpPrefecture compatible method.
  * e.g. `name_h`

## 0.3.1 ##
* Add predicate methods for types.
  * `city?`, `designated_city?`, `ward?`, `special_ward?`, `town?`, `village?`

## 0.3.0 ##
* *Change table schema.*
* Update Data.
  * add district name
  * add romanized name
  * add administrative districts of the oridinance-designated cities

## 0.2.0 ##
* `has_municipality`: Set 'optional: true' as default.

## 0.1.0 ##
* Initial release.
