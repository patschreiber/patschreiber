class Blog < ActiveRecord::Base
  # We want the steps to be ordered by step number, and not the internal id of
  # the record.
  default_scope { order('initial_posting DESC') }
end
