class AddFriendlyIdToReport < ActiveRecord::Migration[5.0]
  def change
    add_column :test_reports, :friendly_id, :string
    add_index  :test_reports, :friendly_id, :unique => true

    TestReport.find_each do |r|
      r.update( :friendly_id => SecureRandom.uuid )
    end

  end

end
