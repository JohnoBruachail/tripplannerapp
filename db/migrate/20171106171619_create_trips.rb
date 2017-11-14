class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :confirmationnumber
      t.string :starttime
      t.string :startdate
      t.string :endtime
      t.string :enddate
      t.string :seatnumber
      t.string :carrier
      t.string :type

      t.timestamps
    end
  end
end
