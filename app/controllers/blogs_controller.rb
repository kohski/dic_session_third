class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    if params[:back]
      @blog = Blog.new(set_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = current_user.blogs.build(set_params)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = current_user.blogs.build(set_params)
    if @blog.update(set_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def confirm
    @blog = Blog.new(set_params)    
  end

  def destroy
    @blog=Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def set_params
    params.require(:blog).permit(:title,:content)
  end

end
