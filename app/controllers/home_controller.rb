class HomeController < ApplicationController
  def index
    @q = Image.includes([:album]).search(params[:q])
    @images = @q.result(:distinct => true).page(params[:page]).per(24)
  end

  def contacts
  end
end
