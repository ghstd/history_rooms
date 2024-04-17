require 'json'

class RoomsController < ApplicationController

  def new
    @rooms = Room.all

    # json_data = File.read('vendor/cohere_standart.json')
    # data = JSON.parse(json_data)

    # data.each do |q|
    #   StandardQuestion.create(question: q['question'], options: q['options'], answer: q['answer'])
    # end

    # json_data = File.read('vendor/cohere_coral.json')
    # data = JSON.parse(json_data)

    # data.each do |q|
    #   CoralQuestion.create(question: q['question'], options: q['options'], answer: q['answer'])
    # end
  end

  def create
    @room = Room.create(current_model: params[:model])
    redirect_to action: 'show', id: @room.room_id
  end

  def show
    @room = Room.find_by(room_id: params[:id])
    if !@room
      redirect_to root_path
    else
      @rooms = Room.all
      @question = Object.const_get(@room.current_model).find(@room.current_question)
    end
  end

  def destroy
    @room = Room.find_by(room_id: params[:id])
    @room.destroy
    redirect_to root_path
  end
end
