require 'rails_helper'

RSpec.describe Page, type: :model do
  it "responds to to_param method" do
    expect(Page).to respond_to(:to_param)
  end
end
