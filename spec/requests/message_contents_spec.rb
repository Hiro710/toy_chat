require 'rails_helper'

RSpec.describe "MessageContents", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/message_contents/show"
      expect(response).to have_http_status(:success)
    end
  end

end
