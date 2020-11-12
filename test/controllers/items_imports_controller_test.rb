require 'test_helper'

class ItemsImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_import = items_imports(:one)
  end

  test "should get index" do
    get items_imports_url
    assert_response :success
  end

  test "should get new" do
    get new_items_import_url
    assert_response :success
  end

  test "should create items_import" do
    assert_difference('ItemsImport.count') do
      post items_imports_url, params: { items_import: {  } }
    end

    assert_redirected_to items_import_url(ItemsImport.last)
  end

  test "should show items_import" do
    get items_import_url(@items_import)
    assert_response :success
  end

  test "should get edit" do
    get edit_items_import_url(@items_import)
    assert_response :success
  end

  test "should update items_import" do
    patch items_import_url(@items_import), params: { items_import: {  } }
    assert_redirected_to items_import_url(@items_import)
  end

  test "should destroy items_import" do
    assert_difference('ItemsImport.count', -1) do
      delete items_import_url(@items_import)
    end

    assert_redirected_to items_imports_url
  end
end
