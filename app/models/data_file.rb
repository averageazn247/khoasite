class DataFile < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.save(upload)
      name =  upload['datafile'].original_filename
      directory = "public/data"
      # create the file path
      path = File.join(directory, name)
      # write the file
      File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    end
    
 def sanitize_filename(file_name)
  # get only the filename, not the whole path (from IE)
  just_filename = File.basename(file_name) 
  # replace all none alphanumeric, underscore or perioids
  # with underscore
  just_filename.sub(/[^\w\.\-]/,'_') 
end   
  def cleanup
    File.delete("#{RAILS_ROOT}/dirname/#{@filename}") 
            if File.exist?("#{RAILS_ROOT}/dirname/#{@filename}")
    end
  
  
  end

end

