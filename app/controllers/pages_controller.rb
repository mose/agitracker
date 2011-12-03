class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def help
    @title = "Help"
  end

  def about
    @title = "About"
  end

  def show
    @page = Page.find(params[:name])
    @title = @page.name
  end
end
