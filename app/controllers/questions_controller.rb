class QuestionsController < ApplicationController

  def create
    @room = Room.find_by(room_id: params[:room_id])
    @question = Object.const_get(@room.current_model).find(@room.current_question)

    current_question = @room.current_question
    count = @room.count

    result = []
    params.each do |key, value|
      if value == 'on'
        result.push key.to_i
      end
    end

    if result == @question.answer
      if (current_question + 1) <= Object.const_get(@room.current_model).count
        @room.update(current_question: current_question + 1, count: count + 1)
      else
        @room.update(current_question: 1, count: 0, result: count + 1)
      end
    else
      if (current_question + 1) <= Object.const_get(@room.current_model).count
        @room.update(current_question: current_question + 1)
      else
        @room.update(current_question: 1, count: 0, result: count)
      end
    end

    @question = Object.const_get(@room.current_model).find(@room.current_question)

    respond_to do |format|
      format.html { redirect_to "/rooms/#{params[:room_id]}", notice: "successfully" }
      format.turbo_stream
    end
  end

end
