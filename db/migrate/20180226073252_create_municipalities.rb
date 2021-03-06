class CreateMunicipalities < ActiveRecord::Migration[5.2]
  def up
    create_table :municipalities, id: :string, primary_key: :code, limit: 6 do |t|
      t.string :prefecture_code, null: false, limit: 2
      t.string :district_name
      t.string :name
      t.string :district_kana
      t.string :kana
      t.string :district_name_e
      t.string :name_e
    end

    add_index :municipalities, :prefecture_code
  end

  def down
    drop_table :municipalities
  end
end
