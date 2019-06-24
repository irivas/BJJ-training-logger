require 'rails_helper'

RSpec.describe "trainings/new", type: :view do
  before(:each) do
    assign(:training, Training.new(
      :location => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new training form" do
    render

    assert_select "form[action=?][method=?]", trainings_path, "post" do

      assert_select "input[name=?]", "training[location]"

      assert_select "textarea[name=?]", "training[description]"
    end
  end
end
