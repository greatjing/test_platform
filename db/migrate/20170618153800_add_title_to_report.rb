class AddTitleToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :test_reports, :name,  :string
  end
end
