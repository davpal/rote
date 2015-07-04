class CreateNotesTags < ActiveRecord::Migration
  def change
    create_table :notes_tags do |t|
      t.belongs_to :note, index: true
      t.belongs_to :tag, index: true
    end
  end
end
