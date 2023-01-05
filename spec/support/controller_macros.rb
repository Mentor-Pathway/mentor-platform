module ControllerMacros
  def login_mentor
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  end

  def login_mentee
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user, role: "mentee")
      sign_in user
    end
  end
end
