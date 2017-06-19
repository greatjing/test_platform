class CreateTestReports < ActiveRecord::Migration[5.0]
  def change
    create_table :test_reports do |t|
      t.string :result
      t.text :version
      t.text :content
      t.text :details
      t.text :condition
      t.timestamps
    end
  end
end
