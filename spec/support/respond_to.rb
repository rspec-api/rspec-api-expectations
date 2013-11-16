def should_respond_to(method)
  respond_to = respond_to? method
  it "have access to the method #{method}" do
    expect(respond_to).to be_true
  end
end

def should_not_respond_to(method)
  respond_to = respond_to? method
  it "do not have access to the method #{method}" do
    expect(respond_to).to be_false
  end
end
