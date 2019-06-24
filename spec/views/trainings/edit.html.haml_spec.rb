require 'rails_helper'

RSpec.describe "trainings/edit", type: :view do
  before(:each) do
    @training = assign(:training, Training.create!(
      :location => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit training form" do
    render

    assert_select "form[action=?][method=?]", training_path(@training), "post" do

      assert_select "input[name=?]", "training[location]"

      assert_select "textarea[name=?]", "training[description]"
    end
  end
end
