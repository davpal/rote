class NotesController < ApplicationController
    def create
        @note = Note.new(note_params)
        @note.save
        redirect_to action: "index"
    end
    
    def index
        @notes = Note.order('notes.created_at DESC').all
    end

    def show
        @note = Note.find(params[:id])
    end

    def new
        @note = Note.new
    end

    def edit
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])
        if @note.update_attributes(user_params)
            redirect_to action: "index"
        else
            render 'edit'
        end
    end

    def destroy
        @note = Note.find(params[:id])
        @note.destroy
        redirect_to action: "index"
    end

    private
    def note_params
        params.require(:note).permit(:title, :text, :created_at)
    end
end
