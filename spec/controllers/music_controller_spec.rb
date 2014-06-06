require 'rails_helper'

RSpec.describe MusicController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'upload'" do
    it "returns http success" do
      get 'upload'
      expect(response).to be_success
    end
  end

  describe "GET 'delete'" do
    it "returns http success" do
      get 'delete'
      expect(response).to be_success
    end
  end

end
