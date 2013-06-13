class WordfileController < ApplicationController
  def craete 
    @wordfile= Wordfile.create(params[:wordfile])
  end
end
