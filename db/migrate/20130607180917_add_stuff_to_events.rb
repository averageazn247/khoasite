class AddStuffToEvents < ActiveRecord::Migration
  def change
       add_column :events, :title ,:string
       add_column :events, :creator , :string
       add_column :events, :dayof ,:date
       add_column :events, :start_time, :time
       add_column :events, :description, :text
       
  end
end
