class RenameFigreColumnToTweets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :figre, :file
  end
end
