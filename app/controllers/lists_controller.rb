class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    # no need for app/views/lists/create.html.erb
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
