require 'rspec'
require 'test_practice'


describe "#my_uniq" do
  let(:array) { [1,2,2,3,4,5] }
  it "removes duplicates from a given array" do
    expect(my_uniq(array)).to eq([1,2,3,4,5])
  end

  it "keeps the same order in which they appear" do
    expect(my_uniq(array.reverse)).to eq([5,4,3,2,1])
  end

  it "does not mutate the original array" do
    new_array = my_uniq(array)
    expect(array).not_to eq(new_array)
  end

end

describe Array do
  describe "#two_sum" do

    let(:array) { [1,-1,3,4,-3,-1,0] }

    context "finds index pair that when added, equals 0" do
        it "pair returns zero" do
          result = array.two_sum
          pair = result.shuffle[0]
          num1 = array[pair[0]]
          num2 = array[pair[1]]
          expect((num1 + num2)).to eq(0)
        end

        it "first index in the pair is smaller than the second" do
          result = array.two_sum
          pair = result[0]
          num1 = pair[0]
          num2 = pair[1]
          expect((num1 < num2)).to be true
        end

        it "array is sorted 'dictionary-wise'" do
          result = array.two_sum
          same_first_index = result.select{ |pair| pair[0] == 0 }
          pair_one = same_first_index[0]
          pair_two = same_first_index[1]
          expect(pair_one[1] < pair_two[1]).to be(true)
        end

    end
  end
end

describe "#my_transpose" do
  let(:array) { [[0, 1, 2],
                 [3, 4, 5],
                 [6, 7, 8]] }

  # before(:each) do
  #   array.my_transpose
  # end
  it "transposes an array" do
    expect(my_transpose(array)).to eq(array.transpose)
  end

  it "raises an error if the array is non-square" do
    expect {my_transpose([ [1, 2, 3], [2, 4] ])}
      .to raise_error(ArgumentError)
  end
end

describe "#stock_picker" do
  let(:array) { [5,4,5,9,1,7,3,8,2] }

  it "returns an array" do
    expect(stock_picker(array)).to be_an_instance_of(Array)
  end

  it "it should return the indexes in order" do
    result = stock_picker(array)
    expect(result).to eq(result.sort)
  end

  it "should correctly point to the maximum difference" do
    expect(stock_picker(array)).to eq([4, 7])
  end

end

describe Hanoi do

  describe "#initialize" do
    it "creates a fresh stack game"

  end

  describe "#get_input" do
    it "raises an error if input is not a valid stack"

  end

  describe "#valid_move?" do
    context "raises an error if player attempts:" do
      it "an illegal stack"

      it "to take from the bottom of the stack"

    end
  end

  describe "#moves_disc" do
    it "correctly moves disc to and from stacks"

  end
end
