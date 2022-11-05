module ControllerMacros
    def login_mentor
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        mentor = FactoryBot.create(:user, role: "mentor")
        sign_in user
      end
    end

    def login_mentee
        before(:each) do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          user = FactoryBot.create(:user, role: "mentee")
          sign_in user
        end
      end
  end