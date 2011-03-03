require 'test_helper'

class ReportStepsControllerTest < ActionController::TestCase
  setup do
    @report_step = report_steps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_steps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_step" do
    assert_difference('ReportStep.count') do
      post :create, :report_step => @report_step.attributes
    end

    assert_redirected_to report_step_path(assigns(:report_step))
  end

  test "should show report_step" do
    get :show, :id => @report_step.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @report_step.to_param
    assert_response :success
  end

  test "should update report_step" do
    put :update, :id => @report_step.to_param, :report_step => @report_step.attributes
    assert_redirected_to report_step_path(assigns(:report_step))
  end

  test "should destroy report_step" do
    assert_difference('ReportStep.count', -1) do
      delete :destroy, :id => @report_step.to_param
    end

    assert_redirected_to report_steps_path
  end
end
