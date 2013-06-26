require_relative '../lib/shoulda_lite'
include ShouldaLite
require_relative './fixtures/model'

describe Model do
  let(:model) { Model.new }
  subject { model }

  it { should have_many(:activities) }
  it { should have_one(:other_thing) }
  it { should validate_presence_of(:email) }
  it { should have_many(:awarded_achievements).dependent(:destroy) }
  it { should have_many(:things).through(:something_else) }
end
