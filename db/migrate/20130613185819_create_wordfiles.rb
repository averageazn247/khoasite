class CreateWordfiles < ActiveRecord::Migration
  def change
    create_table :wordfiles do |t|

      t.timestamps
    end
  end
end
