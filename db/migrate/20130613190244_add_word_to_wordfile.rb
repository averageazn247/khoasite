class AddWordToWordfile < ActiveRecord::Migration
  def change
        add_column :wordfiles, :word_file_name, :string # Original filename
    add_column :wordfiles, :word_content_type, :string # Mime type
    add_column :wordfiles, :word_file_size, :integer # File size in bytes
  end
end
