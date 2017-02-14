require 'rails_helper'

describe 'navigation' do
  describe 'requests index' do
    it "can be accessed" do
      visit requests_path
      expect(page.status_code).to eq(200)
    end

    it "has content" do
      visit requests_path
      expect(page).to have_content(/Requests/)
    end
  end
end
