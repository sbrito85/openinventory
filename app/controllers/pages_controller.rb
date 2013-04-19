class PagesController < ApplicationController
  def home
  	@domain = Domain.new
  	@office = Office.new
  	@device = Device.new
  end
end
