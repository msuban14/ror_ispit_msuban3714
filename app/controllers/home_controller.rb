class HomeController < ApplicationController
  before_action :check_signed_in

  def index
  end

  def check_signed_in
    redirect_to fishing_areas_path if signed_in?
  end
end
