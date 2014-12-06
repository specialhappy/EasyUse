require 'test_helper'

class Maintainer::InstrumentsControllerTest < ActionController::TestCase
  setup do
    @maintainer_instrument = maintainer_instruments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintainer_instruments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintainer_instrument" do
    assert_difference('Maintainer::Instrument.count') do
      post :create, maintainer_instrument: { description: @maintainer_instrument.description, fee_per_hour: @maintainer_instrument.fee_per_hour, img_url: @maintainer_instrument.img_url, institution_id: @maintainer_instrument.institution_id, model: @maintainer_instrument.model, name: @maintainer_instrument.name, price: @maintainer_instrument.price, status: @maintainer_instrument.status, user_id: @maintainer_instrument.user_id }
    end

    assert_redirected_to maintainer_instrument_path(assigns(:maintainer_instrument))
  end

  test "should show maintainer_instrument" do
    get :show, id: @maintainer_instrument
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintainer_instrument
    assert_response :success
  end

  test "should update maintainer_instrument" do
    patch :update, id: @maintainer_instrument, maintainer_instrument: { description: @maintainer_instrument.description, fee_per_hour: @maintainer_instrument.fee_per_hour, img_url: @maintainer_instrument.img_url, institution_id: @maintainer_instrument.institution_id, model: @maintainer_instrument.model, name: @maintainer_instrument.name, price: @maintainer_instrument.price, status: @maintainer_instrument.status, user_id: @maintainer_instrument.user_id }
    assert_redirected_to maintainer_instrument_path(assigns(:maintainer_instrument))
  end

  test "should destroy maintainer_instrument" do
    assert_difference('Maintainer::Instrument.count', -1) do
      delete :destroy, id: @maintainer_instrument
    end

    assert_redirected_to maintainer_instruments_path
  end
end
