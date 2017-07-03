class TestReportsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @test_reports = TestReport.all
  end

  def show
    #@test_report = TestReport.find(params[:id])
    @test_report = TestReport.find_by_friendly_id!(params[:id])
  end

end
