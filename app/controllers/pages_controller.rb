class PagesController < ApplicationController

  def show
    @page = Page.find_by_name(params[:name])
    @title = @page.name
  end

end
