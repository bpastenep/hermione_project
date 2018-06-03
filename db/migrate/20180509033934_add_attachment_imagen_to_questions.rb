class AddAttachmentImagenToQuestions < ActiveRecord::Migration[5.1]
  def self.up
    change_table :questions do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :questions, :imagen
  end
end
