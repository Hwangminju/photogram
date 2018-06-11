class AddContentToPosts < ActiveRecord::Migration[5.2]
  def change
    # 글 내용을 저장할 content 
    add_column :posts, :content, :text
  end
end
