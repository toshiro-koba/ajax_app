class PostsController < ApplicationController
  def index
    # @post = Post.find(1) # 1番目のレコードを@postに代入
    @posts = Post.all.order(id: "DESC") # すべてのレコードを@postsに代入
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item}
  end
end
