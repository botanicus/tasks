require "../spec_helper"

describe Tasks::Task do
  describe ".new" do
    # TODO: 10/06/2018 Find a different way to test this, it's a compile-time error like this.
    # it "fails with no arguments" do
    #   expect_raises(ArgumentError) { Tasks::Task.new }
    # end
  end

  describe "#title" do
    it "is the first argument of .new" do
      task = Tasks::Task.new("Do something")
      task.title.should eq "Do something"
    end
  end

  describe "#tags" do
    it "is the second argument of .new" do
      task = Tasks::Task.new("Do something", Set{:important})
      task.tags.includes?(:important).should be_true
    end

    it "contains unique values" do
      task = Tasks::Task.new("Do something", Set{:important})
      task.tags << :important
      task.tags.size.should eq(1)
    end
  end

  describe "#status" do
    it "is the third argument of .new" do
      task = Tasks::Task.new("Do something", Set(Symbol).new, :done)
      task.status.should eq :done
    end

    it "must be one of the defined types" do
      expect_raises(ArgumentError) do
        Tasks::Task.new("Do something", Set(Symbol).new, :custom_status)
      end
    end

    it "defaults to :new" do
      task = Tasks::Task.new("Do something")
      task.status.should eq(:new)
    end
  end
end

describe Tasks::TaskStatusWrapper do
  describe "#done?" do
    it "is true if the task status is done" do
      task = Tasks::Task.new("Do something", status: :done)
      presenter = Tasks::TaskStatusWrapper.new(task)
      presenter.done?.should be_true
    end

    it "is false if the task status is something else" do
      task = Tasks::Task.new("Do something", status: :new)
      presenter = Tasks::TaskStatusWrapper.new(task)
      presenter.done?.should be_false
    end
  end

  describe "#done!" do
    it "sets status to :done" do
      task = Tasks::Task.new("Do something")
      presenter = Tasks::TaskStatusWrapper.new(task)
      presenter.done?.should be_false
      presenter.done!
      presenter.done?.should be_true
    end
  end
end
