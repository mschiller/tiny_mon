require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class CheckRunsControllerTest < ActionController::TestCase
  def setup
    @account = Account.create(:name => 'account')
    @user = @account.users.create(:full_name => 'John Doe', :email => 'john.doe@example.com', :password => '12345', :password_confirmation => '12345', :current_account => @account)
    @site = @account.sites.create(:name => 'example.com', :url => 'http://www.example.com')
    @health_check = @site.health_checks.create(:name => 'Home Page')

    login_with @user
  end
  
  test "should show html index" do
    check_run = @health_check.check_runs.create(:started_at => 2.seconds.ago, :ended_at => Time.now, :status => 'success', :log => [[Time.now, 'Some message']])
    get :index, :account_id => @account, :site_id => @site.to_param, :health_check_id => @health_check.to_param
    assert_response :success
  end
  
  test "should show image index" do
    check_run1 = @health_check.check_runs.create(:started_at => 5.minutes.ago, :ended_at => 4.minutes.ago, :status => 'success', :log => [[Time.now, 'Some message']])
    check_run2 = @health_check.check_runs.create(:started_at => 2.minutes.ago, :ended_at => 1.minute.ago, :status => 'success', :log => [[Time.now, 'Some message']])
    get :index, :account_id => @account, :site_id => @site.to_param, :health_check_id => @health_check.to_param, :format => 'png'
    assert_response :success
    assert_equal 'image/png', @response.headers['Content-Type']
  end
  
  test "should show check run" do
    check_run = @health_check.check_runs.create(:started_at => 2.seconds.ago, :ended_at => Time.now, :status => 'success', :log => [[Time.now, 'Some message']])
    get :show, :account_id => @account, :site_id => @site.to_param, :health_check_id => @health_check.to_param, :id => check_run
    assert_response :success
    assert assigns(:check_run).is_a?(CheckRun)
  end
  
  test "should create check run" do
    assert_difference 'CheckRun.count' do
      post :create, :account_id => @account, :site_id => @site.to_param, :health_check_id => @health_check.to_param
      assert_response :redirect
    end
  end
end
