class PagesController < ApplicationController

  def show
    @page = Page.where(page_params).first
    if @page
      @title = @page.name
    else
      render '404'
    end
  end

  def page_params
    params.permit(:name, :title, :description, :content)
  end

end
