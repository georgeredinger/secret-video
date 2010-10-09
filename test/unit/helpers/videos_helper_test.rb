require 'test_helper'

class VideosHelperTest < ActionView::TestCase

  test "s3 url_to_location" do
   url="http://s3.amazonaws.com/georgeredinger/oggnano.ogv"
   location,host,bucket,file=url_to_location(url)
   assert_equal location,"amazon_s3_redirect"
   assert_equal host,"s3.amazonaws.com"
   assert_equal bucket, "georgeredinger"
   assert_equal file,"oggnano.ogv"
  end

  test "plain url_to_location" do
   url="http://localhost/oggnano.ogv"
   location,host,bucket,file=url_to_location(url)
   assert_equal location,"url_redirect"
   assert_equal host,"localhost"
   assert_equal bucket,""
   assert_equal file,"oggnano.ogv"
  end

test "complex url_to_location" do
   url="http://someplace/deeplynested/inthedeepness/of/some/heirarchy/oggnano.ogv"
   location,host,bucket,file=url_to_location(url)
   assert_equal location,"url_redirect"
   assert_equal host,"someplace"
   assert_equal bucket,""
   assert_equal file,"deeplynested/inthedeepness/of/some/heirarchy/oggnano.ogv"
   assert_equal url.gsub("http://","") , "#{host}/#{bucket}#{file}"
  end

end
