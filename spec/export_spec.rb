require 'serve/export'

describe Serve::Exporter do
  %w|.coffee .jsx|.each do |ext|
    it "can compile those with #compiled_extension of #{ext}" do
      subject.compiled_extensions.should include ext
    end
  end
end
