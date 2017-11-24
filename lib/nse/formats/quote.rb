module Formats
  class Quote < OpenStruct
    # if the keys are being changed more than once we should consider hardcoding them
    # as attribute and constant instead of using openstruct
    def initialize(attr_map)
      super(attr_map.except('data').merge(attr_map['data'].first))
    end
  end
end
