class Admin::PagesController < ApplicationController

  def index
    @pages = Page.all
    @title = "Pages list"
  end

  def show
    @page = Page.find(params[:name])
    @title = "Show " + @page.name
  end

  def new
    @page = Page.new
    @title = "New page"
  end

  def create
    Page.create(params[:page])
    redirect_to :index
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:success] = "ok, saved."
      redirect_to :action => "show", :id => @page.id
    else
      flash[:failure] = "failed to save"
      render :action => "edit"
    end
  end

  def delete
  end

end
