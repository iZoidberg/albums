require 'spec_helper'

describe Album do
  it "has a valid factory" do
    FactoryGirl.create(:album).should be_valid
  end
  describe "search by user" do
    before :each do
      @u1 = FactoryGirl.create(:user);
      @u2 = FactoryGirl.create(:user);
      @a1 = FactoryGirl.create(:album, title: "Album 1", user_id: @u1.id)
      @a2 = FactoryGirl.create(:album, title: "Album 2", user_id: @u1.id)
      @a3 = FactoryGirl.create(:album, title: "Album 3", user_id: @u2.id)
    end

    it "returns a matching result for user 1" do
      Album.by_user(@u1.id).should eq [@a1, @a2]
    end
    it "returns one matching result for url_scope" do
      Album.by_user(@u1.id).should_not include @a3
    end
  end
end
