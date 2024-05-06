class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [ :show, :edit, :update, :destroy ]

  # GET /notes or /notes.json
  def index
    if params[:invite].present?
      encrypted_url = params[:invite]
      user_id, note_id = Note.decrypt_url(encrypted_url)
      note = Note.find(note_id)
      if !current_user.notes.include?(note)
        current_user.notes << note
      end
      @notes = current_user.notes
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
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy!

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_note
      @note = current_user.notes.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :body)
    end
end
