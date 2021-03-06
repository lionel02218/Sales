require "test_helper"

class ProductsControllerTest < ActionController::TestCase
  def product
    @product ||= products :a1
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Product.count") do
      post :create, product: { category_id: product.category_id, name: product.name, price: product.price, quantity: product.quantity }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  def test_show
    get :show, id: product
    assert_response :success
  end

  def test_edit
    get :edit, id: product
    assert_response :success
  end

  def test_update
    put :update, id: product, product: { category_id: product.category_id, name: product.name, price: product.price, quantity: product.quantity }
    assert_redirected_to product_path(assigns(:product))
  end

  def test_destroy
    assert_difference("Product.count", -1) do
      delete :destroy, id: product
    end

    assert_redirected_to products_path
  end
end
