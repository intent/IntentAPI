require 'test_helper'

class IntentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Intent.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Intent.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Intent.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to intent_url(assigns(:intent))
  end

  def test_edit
    get :edit, :id => Intent.first
    assert_template 'edit'
  end

  def test_update_invalid
    Intent.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Intent.first
    assert_template 'edit'
  end

  def test_update_valid
    Intent.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Intent.first
    assert_redirected_to intent_url(assigns(:intent))
  end

  def test_destroy
    intent = Intent.first
    delete :destroy, :id => intent
    assert_redirected_to intents_url
    assert !Intent.exists?(intent.id)
  end
end
