class ViewerController < ApplicationController
  after_action :allow_iframe!

  def show
    begin
      @map = Multimap.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @map = Map.friendly.find(params[:id])
    end

    render layout: 'fullmap'
  end

  protected

  def allow_iframe!
    response.headers.except! 'X-Frame-Options'
  end
end
