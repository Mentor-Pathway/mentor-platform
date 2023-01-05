require "rails_helper"

RSpec.describe "Pathways", type: :request do
  describe "GET /edit" do
    context "mentor can access" do
      it "should return 200:OK" do
        mentor = create(:user, role: "mentor")
        pathway = create(:pathway, user: mentor)
        login_as mentor
        get edit_pathway_path(pathway)
        expect(response).to have_http_status(:success)
      end
    end

    context "mentee cannot access" do
      it "should redirect ro root" do
        mentee = create(:user, role: "mentee")
        pathway = create(:pathway, user: mentee)
        login_as mentee
        get edit_pathway_path(pathway)
        expect(response).to redirect_to(root_path)
      end
    end

    context "not signed in cannot access" do
      it "should redirect to root" do
        pathway = create(:pathway)
        get edit_pathway_path(pathway)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
