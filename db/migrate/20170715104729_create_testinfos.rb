class CreateTestinfos < ActiveRecord::Migration[5.0]
  def change
    create_table :testinfos do |t|
      t.integer :test_report_id, :index => true
      t.string  :name
      t.text    :description
      t.timestamps
    end
  end
end
