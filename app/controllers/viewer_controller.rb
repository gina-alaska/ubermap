class ViewerController < ApplicationController
  def show
    @map = Map.where('lower(slug) = ?', params[:slug]).first

    render layout: 'fullmap'
  end
  
  after_action :allow_iframe!

  protected

  def allow_iframe!
    response.headers.except! 'X-Frame-Options'
  end  
end
