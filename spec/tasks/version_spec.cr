describe Tasks do
  it "is semantically versioned" do
    Tasks::VERSION.should eq("0.1.0")
    # TODO: 11/06/2018 It says it's not matching.
    # Tasks::VERSION.should match(/^\d+\.\d+\.\d+$/)
    # /^\d+\.\d+\.\d+$/.should match(Tasks::VERSION)
  end
end
