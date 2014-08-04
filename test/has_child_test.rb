# encoding: utf-8

require_relative "test_helper"

class TestHasChild < Minitest::Unit::TestCase

  def setup
    super

    @products = store_names(['Product A', 'Product B'])

    store([{ name: 'Apple',   product_id: @products.first.id },
           { name: 'Samsung', product_id: @products.last.id },
           { name: 'Iphone',  product_id: @products.first.id }], Tag)
  end

  def test_without_filter
    assert_search '*', ['Product A', 'Product B']
  end

  def test_with_filter
    assert_search '*', [@products.first.name], has_child: { type: 'tag', where: { name: 'Apple' } }
  end

end

