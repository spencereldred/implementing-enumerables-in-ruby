describe GschoolEnumerable do

  before(:each) do
    Array.include GschoolEnumerable
  end

  describe "#g_each" do
    it "yields each element to the block in the same order" do
      yielded = []
      test_array = [1,2,3]

      result = test_array.g_each { |value| yielded << value }

      expect(yielded).to eq(test_array)
      expect(result).to eq(test_array)
    end
  end

  describe "#g_select" do
    it "acts like select" do
      values = [1, 2, 3].g_select { |value| value % 2 == 0 }

      expect(values).to eq([2])
    end
  end

  describe "#g_reject" do
    it "acts like reject" do
      values = [1, 2, 3].g_reject { |value| value % 2 == 0 }

      expect(values).to eq([1, 3])
    end
  end

  describe "#g_map" do
    it "acts like map" do
      values = [1, 2, 3].g_map { |value| value * 2 }

      expect(values).to eq([2, 4, 6])
    end
  end

  describe "#g_find" do
    it "acts like find" do
      value = [1, 2, 3].g_find { |value| value % 2 != 0 }

      expect(value).to eq(1)
    end

    it "returns nil if nothing is found" do
      value = [1, 2, 3].g_find { |value| value > 5 }

      expect(value).to eq(nil)
    end
  end

  describe "#g_select!" do

    it "acts like select!" do
      items = [1, 2, 3]

      items.g_select! { |value| value % 2 == 0 }

      expect(items).to eq([2])
    end
  end
end
