class CreateToilets < ActiveRecord::Migration[6.0]
  def change
    create_table :toilets do |t|
      t.string      :name,          null:false
      t.integer     :category_id,   null:false
      t.integer     :condition_id,  null:false
      t.integer     :number_id,     null:false
      t.integer     :multi_id,      null:false
      t.references  :user,          null:false, foreign_key: true
      t.timestamps
    end
  end
end