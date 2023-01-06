class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private

  def comment_params
    #require：モデル 、 permitは入力フォームがあるところ（入力されている情報のキー（カラム名））、 merge：後から持っていく情報(カラム名、値)=カラムに値を入れている
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
