class ChatsController < ApplicationController
    def show
        @user = User.find(params[:id])
        if @user.is_active
            if @user == current_user
                flash[:notice] = '※無効な操作です'
                redirect_to root_path
            end
            rooms = current_user.user_rooms.pluck(:room_id)
            user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)
            unless user_rooms.nil?
                @room = user_rooms.room
            else
                @room = Room.new
                @room.save
                UserRoom.create(user_id: current_user.id, room_id: @room.id)
                UserRoom.create(user_id: @user.id, room_id: @room.id)
            end
            @chats = @room.chats
            @chat = Chat.new(room_id: @room.id)
        else
            redirect_to user_path(current_user)
        end
    end
    def create
        @chat = current_user.chats.new(chat_params)
        if @chat.save
            Notification.create!(chat_id: @chat.id, user_id: params[:chat][:user_id])
            redirect_to request.referer
        end
    end
    private
    def chat_params
        params.require(:chat).permit(:message, :room_id)
    end
end
