module WillPaginate
  module ActionView
    def will_paginate collection = nil, options = {}
      options[:renderer] = BootstrapPagination::Rails
      super
    end
  end
end
