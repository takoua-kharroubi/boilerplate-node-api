require 'spec_helper'

describe file('.git/hooks') do
  it { should be_symlink }
end
