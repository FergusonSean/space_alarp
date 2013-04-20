class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|

      t.timestamps
    end
    
    add_column :sectors, :ship_id, :integer
  end
end
