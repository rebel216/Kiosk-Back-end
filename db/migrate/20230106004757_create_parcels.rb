class CreateParcels < ActiveRecord::Migration[7.0]
  def change
    create_table :parcels do |t|
      t.string :fname
      t.string :lname
      t.string :rfname
      t.string :rlname
      t.string :address1
      t.string :pincode1
      t.string :city1
      t.string :state1
      t.string :phone1
      t.string :address2
      t.string :pincode2
      t.string :city2
      t.string :state2
      t.string :phone2
      t.string :weight
      t.string :price
      t.string :accesstoken
      t.string :reference
      t.string :postType
      t.string :barcode
      t.string :postoffice


      t.timestamps
    end
  end
end
