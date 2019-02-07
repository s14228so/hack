class Api::EventsController < ApplicationController
  protect_from_forgery :except => [:index,:create]
  def create
    # すでにイイネ送信済みだったら
    if current_user.likes_users.exists?(id: params[:user_id])
      render json: { error: 'you have already sent IINE to him.' }, status: 401
    # 相手からのイイネをすでに受け取っていたら
    elsif current_user.liked_users.exists?(id: params[:user_id])
      # イイネを作成してマッチを成立させる
      LikesUser.create!(user_id: current_user.id,
                        to_likes_user_id: params[:user_id],
                        status: 1)
      like_create_frag = LikesUser.where(user_id: params[:user_id])
                      .find_by(to_likes_user_id: current_user.id)
                      .update(status: 1)
      room = ChatRoom.new
      room.save!
      room.room_users.create(user_id: current_user.id)
      room.room_users.create(user_id: params[:user_id])
      render json: like_create_frag
    # 上記以外の場合
    else
      # イイネを作成する
      like_create_frag = LikesUser.create!(user_id: current_user.id,
                        to_likes_user_id: params[:user_id],
                        status: 0)
      render json: like_create_frag
    end
  end
end
