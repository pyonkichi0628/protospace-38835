 class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  #いるかわからない
  #before_action :contributor_confirmation, only: [:edit, :update, :destroy]
 # before_action :set_prototype, except: [:index, :new, :create]


  def index
    @prototype = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def edit
    @prototype = Prototype.find(params[:id])
    redirect_to root_path unless current_user.id == @prototype.user_id
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end 
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    end
  end


  private
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to action: index
    end
  end
  
  def prototype_params
    #require：モデル 、 permitは入力フォームがあるところ（入力されている情報のキー（カラム名））、 merge：後から持っていく情報　(カラム名、値)=カラムに値を入れている
    params.require(:prototype).permit(:title, :catch_copy, :concept, :user, :image).merge(user_id: current_user.id)
  end

  #いるかわからないーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー’
 # def set_prototype
  #  @prototype = Prototype.find(params[:id])
 # end


  #いるかわからないーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー’
 # def contributor_confirmation
  #  redirect_to root_path unless current_user == @prototype.user
  #end

end
  