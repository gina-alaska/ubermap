class ViewerController < ApplicationController
  after_action :allow_iframe!

  def show
    @map = Map.where('lower(slug) = ?', params[:slug]).first

    render layout: 'fullmap'
  end
  
  protected

  def allow_iframe!
    response.headers.except! 'X-Frame-Options'
  end  
end
