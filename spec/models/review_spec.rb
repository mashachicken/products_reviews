require 'rails_helper'

describe Reviews do
  it { should belong_to(:product) }
end
