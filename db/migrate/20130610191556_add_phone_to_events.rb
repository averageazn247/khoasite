class AddPhoneToEvents < ActiveRecord::Migration
  def change
    add_column :events, :phone ,:boolean
  end
end
