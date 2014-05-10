class PagesController < ApplicationController

  def show
    @page = Page.where(name: params[:name]).first
    @title = @page.name
  end

end
