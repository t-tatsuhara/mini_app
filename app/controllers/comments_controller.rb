class CommentsController < ApplicationController
  
  before_action :move_to_index, except: [:index]

  def index
    redirect_to controller: 'users', action: 'show',id: current_user.id  if user_signed_in?
    @comments = Comment.order("id DESC").page(params[:page]).per(10)
  end
  
  def new
    @user = User.find(current_user.id)
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.create(comment: params_comment,user_id: current_user.id)
    redirect_to controller: 'users', action: 'show',id: current_user.id  if user_signed_in?
  end

  def edit
    @user = User.find(current_user.id)
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id]).delete
    redirect_to controller: 'users', action: 'show',id: current_user.id  if user_signed_in?
  end

  def update
    @comment = Comment.find(params[:id]).update(comment: params_comment)
    redirect_to controller: 'users', action: 'show',id: current_user.id  if user_signed_in?  
  end


    private
  def move_to_index
    redirect_to  action: :index unless user_signed_in?
  end

  def params_comment
    params.require(:comment)[:comment]
  end



end
