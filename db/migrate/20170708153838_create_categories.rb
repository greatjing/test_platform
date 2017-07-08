class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    #给test_reports表添加字段和索引
    add_column :test_reports, :category_id, :integer
    add_index  :test_reports, :category_id

  end
end
