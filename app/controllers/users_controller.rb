class UsersController < ApplicationController

  def show
    #特定の一人の情報を取得
    #＠ユーザーに紐づくプロトタイプたち
    @user = User.find(params[:id])
   
    @prototypes = @user.prototypes
  end

end
