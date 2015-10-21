class PagesController < ApplicationController

  def show
    @page = Page.where(page_params).first
    @title = @page.name
  end

  def page_params
    params.permit(:name, :title, :description, :content)
  end

end
