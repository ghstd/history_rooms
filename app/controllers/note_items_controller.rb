class NoteItemsController < ApplicationController
  before_action :set_note
  before_action :set_note_item, only: [ :edit, :update, :destroy ]

  def new
    @note_item = @note.note_items.build
  end

  def edit
  end

  def create
    @note_item = @note.note_items.build(note_item_params)

    respond_to do |format|
      if @note_item.save
        format.html { redirect_to note_path(@note), notice: "note_item was successfully created." }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note_item.update(note_item_params)
        format.html { redirect_to note_path(@note), notice: "note was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note_item.destroy!

    respond_to do |format|
      format.html { redirect_to note_path(@note), notice: "note_item was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

    def set_note_item
      @note_item = @note.note_items.find(params[:id])
    end

    def set_note
      @note = Note.find(params[:note_id])
    end

    def note_item_params
      params.require(:note_item).permit(:body)
    end
end
