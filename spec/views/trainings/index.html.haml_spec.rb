require 'rails_helper'

RSpec.describe "trainings/index", type: :view do
  before(:each) do
    assign(:trainings, [
      Training.create!(
        :location => "Location",
        :description => "MyText"
      ),
      Training.create!(
        :location => "Location",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of trainings" do
    render
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
