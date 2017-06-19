class Admin::TestReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @test_reports = TestReport.all
  end

  def show
    @test_report =  TestReport.find(params[:id])
  end

  def new
    @test_report = TestReport.new
  end

  def create
    @test_report = TestReport.new(test_report_params)
    if @test_report.save
      redirect_to admin_test_reports_path, notice:  "新建成功"

    else
      render :new
    end
  end

  def edit
    @test_report = TestReport.find(params[:id])
  end

  def update
    @test_report = TestReport.find(params[:id])
    ##byebug
    if @test_report.update(test_report_params)
      redirect_to admin_test_reports_path, notice: "修改成功"
    else
      render :edit
    end
  end

  def destroy
    @test_report = TestReport.find_by(params[:id])
    @test_report.destroy
    redirect_to admin_test_reports_path , alert: "删除成功"
  end

  def admin_required
    if !current_user.is_admin?
      redirect_to "/", alert: "you are not admin."
    end
  end

  private

  def test_report_params
    params.require(:test_report).permit(:name, :result, :version, :content, :details, :condition)
  end
end
