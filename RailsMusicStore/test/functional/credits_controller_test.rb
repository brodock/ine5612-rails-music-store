require File.dirname(__FILE__) + '/../test_helper'
require 'credits_controller'

# Re-raise errors caught by the controller.
class CreditsController; def rescue_action(e) raise e end; end

class CreditsControllerTest < Test::Unit::TestCase
  def setup
    @controller = CreditsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
