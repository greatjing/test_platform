class TestReportsController < ApplicationController
  def index
    @test_reports = TestReport.all
  end
end
