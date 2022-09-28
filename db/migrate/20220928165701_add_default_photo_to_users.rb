class AddDefaultPhotoToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :photo, :string, default: 'https://www.computerhope.com/jargon/g/guest-user.jpg'
  end
end
