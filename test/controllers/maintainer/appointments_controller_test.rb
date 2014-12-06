require 'test_helper'

class Maintainer::AppointmentsControllerTest < ActionController::TestCase
  setup do
    @maintainer_appointment = maintainer_appointments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintainer_appointments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintainer_appointment" do
    assert_difference('Maintainer::Appointment.count') do
      post :create, maintainer_appointment: { date: @maintainer_appointment.date, fee: @maintainer_appointment.fee, group_id: @maintainer_appointment.group_id, instrument_id: @maintainer_appointment.instrument_id, price_paid: @maintainer_appointment.price_paid, status: @maintainer_appointment.status, submit_time: @maintainer_appointment.submit_time, time: @maintainer_appointment.time, user_id: @maintainer_appointment.user_id }
    end

    assert_redirected_to maintainer_appointment_path(assigns(:maintainer_appointment))
  end

  test "should show maintainer_appointment" do
    get :show, id: @maintainer_appointment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintainer_appointment
    assert_response :success
  end

  test "should update maintainer_appointment" do
    patch :update, id: @maintainer_appointment, maintainer_appointment: { date: @maintainer_appointment.date, fee: @maintainer_appointment.fee, group_id: @maintainer_appointment.group_id, instrument_id: @maintainer_appointment.instrument_id, price_paid: @maintainer_appointment.price_paid, status: @maintainer_appointment.status, submit_time: @maintainer_appointment.submit_time, time: @maintainer_appointment.time, user_id: @maintainer_appointment.user_id }
    assert_redirected_to maintainer_appointment_path(assigns(:maintainer_appointment))
  end

  test "should destroy maintainer_appointment" do
    assert_difference('Maintainer::Appointment.count', -1) do
      delete :destroy, id: @maintainer_appointment
    end

    assert_redirected_to maintainer_appointments_path
  end
end
