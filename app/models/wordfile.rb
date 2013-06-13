class Wordfile < ActiveRecord::Base
  # attr_accessible :title, :body
  has_attached_file :word
end
