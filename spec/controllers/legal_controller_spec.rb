# frozen_string_literal: true
require 'rails_helper'

RSpec.describe LegalController, type: :controller do
  describe "GET #terms" do
    it "returns http success" do
      get :terms
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #privacy_policy" do
    it "returns http success" do
      get :privacy_policy
      expect(response).to have_http_status(:success)
    end
  end

end
