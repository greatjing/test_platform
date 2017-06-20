class TestReportsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @test_reports = TestReport.all
  end

  def show
    @test_report = TestReport.find(params[:id])
  end

end
