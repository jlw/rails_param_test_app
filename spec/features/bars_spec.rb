require "rails_helper"

RSpec.describe "bars search" do
  it "handles GET searches" do
    visit "/bars"
    within "#get-search" do
      fill_in "Foo", with: "fff"
      select "User 1", from: "User"
      click_on "Search"
    end

    expect(page).to have_css("#param-foo", text: "“fff”")
    expect(page).to have_css("#param-user-id", text: "“1”")
  end

  it "handles GET searches without a user ID" do
    pending "not handled by rails_param v1.3.1"

    visit "/bars"
    within "#get-search" do
      fill_in "Foo", with: "fff"
      click_on "Search"
    end

    expect(page).to have_css("#param-foo", text: "“fff”")
    expect(page).to have_css("#param-user-id", text: "“”")
  end

  it "fails on GET searches without a user ID" do
    visit "/bars"
    within "#get-search" do
      fill_in "Foo", with: "fff"
      expect { click_on "Search" }.to raise_exception RailsParam::InvalidParameterError, "'' is not a valid Integer"
    end
  end

  it "handles POST searches" do
    visit "/bars"
    within "#post-search" do
      fill_in "Foo", with: "fff"
      select "User 1", from: "User"
      click_on "Search"
    end

    expect(page).to have_css("#param-foo", text: "“fff”")
    expect(page).to have_css("#param-user-id", text: "“1”")
  end

  it "handles POST searches without a user ID" do
    pending "not handled by rails_param v1.3.1"

    visit "/bars"
    within "#post-search" do
      fill_in "Foo", with: "fff"
      click_on "Search"
    end

    expect(page).to have_css("#param-foo", text: "“fff”")
    expect(page).to have_css("#param-user-id", text: "“”")
  end

  it "fails on POST searches without a user ID" do
    visit "/bars"
    within "#post-search" do
      fill_in "Foo", with: "fff"
      expect { click_on "Search" }.to raise_exception RailsParam::InvalidParameterError, "'' is not a valid Integer"
    end
  end
end
