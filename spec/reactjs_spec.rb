require 'serve'

shared_context 'jsx handler' do
  let :handler do
    Serve::JsxHandler.new '.', './fixtures'
  end
end

describe 'what it can do different from defaults' do
  include_context 'jsx handler'
  subject do
    handler
  end

  it 'should override its extension' do
    should respond_to :compiled_extension
    subject.compiled_extension.should eq 'js'
  end
end

describe 'parsing input' do
  include_context 'jsx handler'
  subject do
    jsx = <<-EOF
/** @jsx React.DOM */
React.renderComponent(
  <h1>Hello, world!</h1>,
  document.getElementById('example')
);
    EOF
    handler.parse jsx, ''
  end

  it 'should write a nice string' do
    subject.should eq(<<-EOF
/** @jsx React.DOM */
React.renderComponent(
  React.DOM.h1(null, "Hello, world!"),
  document.getElementById('example')
);
EOF
    )
  end
end
