class CreateAttachments < ActiveRecord::Migration
  def self.up
        create_table :attachments do |t|
            t.column :filename, :string
            t.column :creater, :string
            t.column :title, :string
            t.column :data, :binary
        end
    end

    def self.down
        drop_table :attachments
    end
end
