class AddStatusToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :test_reports, :status, :string, :default => "draft"
  end
end
