class CreateTestReports < ActiveRecord::Migration[5.0]
  def change
    create_table :test_reports do |t|
      t.string :result
      t.string :version
      t.string :content
      t.string :details
      t.string :condition
      t.timestamps
    end
  end
end
