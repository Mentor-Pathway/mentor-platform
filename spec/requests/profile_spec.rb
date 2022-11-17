require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  describe "GET /edit" do

    context "profile owner can access" do
      it "should return 200:OK" do
        profile = create(:profile)
        login_as profile.user
        get edit_profile_path(profile)
        expect(response).to have_http_status(:success)
      end
    end

    context "not profile owner cannot access" do
      it "should return 401:UNAUTHORIZED" do
        profile = create(:profile)
        user = create(:user)
        login_as user
        get edit_profile_path(profile)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
