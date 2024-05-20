class NotesController < ApplicationController
  before_action :set_note, only: [ :show, :edit, :update, :destroy ]

  # GET /notes or /notes.json
  def index
    if params[:invite].present?
      encrypted_url = params[:invite]
      _, note_id = ApplicationRecord.decrypt_url(encrypted_url) # user_id, note_id
      note = Note.find_by(id: note_id)

      if note.nil?
        redirect_to root_path
        return
      end

      if !current_user.notes.include?(note)
        current_user.notes << note
      end
      redirect_to note_url(note)
    else
      @notes = current_user.notes
    end
  end

  # GET /notes/1 or /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = current_user.notes.build
  end

  # GET /notes/1/edit
  def edit
  end

  # note /notes or /notes.json
  def create
    @note = current_user.notes.build(note_params)

    respond_to do |format|
      if current_user.save
        format.html { redirect_to note_url(@note), notice: "note was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "note was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    current_user.notes.destroy(@note)

    if @note.users.count == 0
      @note.destroy
    end

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "note was successfully destroyed." }
    end
  end

  private

    def set_note
      @note = current_user.notes.find_by(id: params[:id])
      if @note.nil?
        redirect_to root_path
      end
    end

    def note_params
      params.require(:note).permit(:title)
    end
end
