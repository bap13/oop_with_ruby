require 'spec_helper'

describe Array do
  context "#all_empty?" do
    it "returns true if all elements of the array are empty" do
      expect(["", "", ""].all_empty?).to be_truthy
    end

    it "returns false if some of the array elements are not empty" do
      expect(["Hello", "Pizza", ""].all_empty?).to be_falsey
    end

    it "returns true for an empty array" do
      expect([].all_empty?).to be_truthy
    end
  end

  context "#all_same?" do
    it "returns true if all elements of the array are the same" do
      expect(["a", "a", "a"].all_same?).to be_truthy
    end

    it "returns false if one element is different" do
      expect(["a", "b", "a"].all_same?).to be_falsey
    end

    it "returns true for an empty array" do
      expect([].all_same?).to be_truthy
    end
  end

  context "#any_empty?" do
    it "returns true if any elements of the array is empty" do
      expect(["a", "a", ""].any_empty?).to be_truthy
    end

    it "returns false if all elements are not empty" do
      expect(["a", "a", "b"].any_empty?).to be_falsey
    end

    it "returns false for an empty array" do
      expect([].any_empty?).to be_falsey
    end
  end

  context "#none_empty?" do
    it "returns true if no elements are empty" do
      expect(["a", "a", "b"].none_empty?).to be_truthy
    end

    it "returns false if an element is empty" do
      expect(["a", "", "b"].none_empty?).to be_falsey
    end

    it "returns true for empty array" do
      expect([].none_empty?).to be_truthy
    end
  end
end
