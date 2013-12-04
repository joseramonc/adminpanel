require 'spec_helper'

describe "Authentication" do

  	subject { page }
	describe "sign in page" do
	    before { visit adminpanel.signin_path }

	    it { should have_content(I18n.t("Welcome")) }

	    it { expect(page).to have_title(I18n.t("Panel title")) }
	end

    describe "signin" do
	    before { visit adminpanel.signin_path }

	    describe "with invalid information" do
	      	before { click_button "signin-button" }

	    	it { expect(page).to have_title(I18n.t("Panel title")) }

	      	it { should have_selector('div.alert.alert-error', :text => I18n.t("Signin error")) }
	    end

	    describe "with valid information" do
	    	let(:user) { Factory(:user) }
	    	before do
	    		fill_in "inputEmail", :with => user.email
	    		fill_in "inputPassword", :with => user.password
	    		click_button "signin-button"
	    	end

	    	it { should have_selector('div.alert.alert-success', :text => I18n.t("Signin success")) }
	    	it { should have_selector('i.icon-off') }

	    	describe "signing out" do
	    		before { click_link "signout-button"}

	    		it { current_path.should == adminpanel.signin_path }
	    		it { expect(page).to have_title(I18n.t("Panel title")) }
	    		
	    	end
	    end
	end
end