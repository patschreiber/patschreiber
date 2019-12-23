require 'rails_helper'

RSpec.describe CareerController, type: :controller do

  describe "GET #mission_statement" do
    it "returns http success" do
      get :mission_statement
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #resume" do
    it "returns http success" do
      get :resume
      expect(response).to have_http_status(:success)
    end
  end

end
