require File.dirname(__FILE__) + '/../test_helper'
require 'admin_artists_controller'

# Re-raise errors caught by the controller.
class AdminArtistsController; def rescue_action(e) raise e end; end

class AdminArtistsControllerTest < Test::Unit::TestCase
  def setup
    @controller = AdminArtistsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
