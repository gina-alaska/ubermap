class ViewerController < ApplicationController
  after_action :allow_iframe!

  def show
    begin
      @map = Multimap.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      begin
        @map = Map.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      end
    end

    render layout: 'fullmap'
  end

  protected

  def allow_iframe!
    response.headers.except! 'X-Frame-Options'
  end
end
