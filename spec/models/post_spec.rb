require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validations" do
    it { should validate_presence_of(:title_pt) }
    it { should validate_presence_of(:title_es) }
    it { should validate_presence_of(:text_pt) }
    it { should validate_presence_of(:text_es) }
    it { should validate_presence_of(:tags_pt) }
    it { should validate_presence_of(:tags_es) }
  end
end
