require 'serve'

describe Serve::FileTypeHandler do
  subject do
    Serve::FileTypeHandler.new '.', './templates', '.xxx'
  end

  [ :layout?, :content_type, :process, :parse ].each do |mth|
    it do
      should respond_to mth
    end
  end

  it do
    subject.extension.should eq '.xxx'
  end
end
