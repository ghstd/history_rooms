class MessagesController < ApplicationController

  def create
    @room = Room.find_by(room_id: params[:room_id])
    @room.messages.create(body: message_params[:body], author: current_user.name)
    @rooms = Room.all
    respond_to do |format|
      format.html { redirect_to "/rooms/#{@room.room_id}", notice: "successfully" }
      format.turbo_stream
    end
  end

  private

  def message_params
    params.require(:messages).permit(:body)
  end
end
