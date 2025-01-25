require "application_system_test_case"

class ParticipantsTest < ApplicationSystemTestCase
  setup do
    @participant = participants(:one)
  end

  test "visiting the index" do
    visit participants_url
    assert_selector "h1", text: "Participants"
  end

  test "should create participant" do
    visit participants_url
    click_on "New participant"

    fill_in "Account name", with: @participant.account_name
    fill_in "Account number", with: @participant.account_number
    fill_in "Bank name", with: @participant.bank_name
    fill_in "Date of birth", with: @participant.date_of_birth
    fill_in "Email address", with: @participant.email_address
    fill_in "First name", with: @participant.first_name
    fill_in "Gender", with: @participant.gender
    fill_in "Home address", with: @participant.home_address
    fill_in "Lga", with: @participant.lga
    fill_in "Marital status", with: @participant.marital_status
    fill_in "Middle name", with: @participant.middle_name
    fill_in "Phone number", with: @participant.phone_number
    fill_in "State", with: @participant.state
    fill_in "Surname", with: @participant.surname
    fill_in "Ward", with: @participant.ward
    fill_in "Year of musabaqa", with: @participant.year_of_musabaqa
    click_on "Create Participant"

    assert_text "Participant was successfully created"
    click_on "Back"
  end

  test "should update Participant" do
    visit participant_url(@participant)
    click_on "Edit this participant", match: :first

    fill_in "Account name", with: @participant.account_name
    fill_in "Account number", with: @participant.account_number
    fill_in "Bank name", with: @participant.bank_name
    fill_in "Date of birth", with: @participant.date_of_birth
    fill_in "Email address", with: @participant.email_address
    fill_in "First name", with: @participant.first_name
    fill_in "Gender", with: @participant.gender
    fill_in "Home address", with: @participant.home_address
    fill_in "Lga", with: @participant.lga
    fill_in "Marital status", with: @participant.marital_status
    fill_in "Middle name", with: @participant.middle_name
    fill_in "Phone number", with: @participant.phone_number
    fill_in "State", with: @participant.state
    fill_in "Surname", with: @participant.surname
    fill_in "Ward", with: @participant.ward
    fill_in "Year of musabaqa", with: @participant.year_of_musabaqa
    click_on "Update Participant"

    assert_text "Participant was successfully updated"
    click_on "Back"
  end

  test "should destroy Participant" do
    visit participant_url(@participant)
    click_on "Destroy this participant", match: :first

    assert_text "Participant was successfully destroyed"
  end
end
