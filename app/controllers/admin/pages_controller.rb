class Admin::PagesController < ApplicationController

  load_and_authorize_resource

  before_filter :get_page_from_id, only: [ :show, :edit, :update, :destroy ]
  before_filter :authenticate_user!

  def index
    @pages = Page.all
    @title = "Pages list"
  end

  def show
    @title = "Show " + @page.name
  end

  def new
    @page = Page.new
    @title = "New page"
  end

  def create
    Page.create(page_params)
    flash[:success] = "ok, saved."
    redirect_to admin_pages_path
  end

  def edit
    @title = "Edit " + @page.name
  end

  def update
    if @page.update_attributes(page_params)
      flash[:success] = "ok, saved."
      redirect_to admin_page_path @page
    else
      flash[:failure] = "failed to save"
      render :edit, id: @page.id
    end
  end

  def destroy
    @page.destroy
    flash[:success] = "ok, destroyed."
    redirect_to admin_pages_path
  end

  private

  def get_page_from_id
    @page = Page.find(params[:id])
  end

  def page_params
    params[:page].permit(:name, :title, :descriptin, :content)
  end

end
