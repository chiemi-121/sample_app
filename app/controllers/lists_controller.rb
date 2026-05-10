class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
    # index画面で投稿フォームも表示している場合は、空のインスタンスが必要
    @list = List.new 
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to lists_path # '/lists' より lists_path の方が安全です
  end

  private

  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end