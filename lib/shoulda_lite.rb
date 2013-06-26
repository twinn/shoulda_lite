require 'active_record_stub'
require 'factory_girl_stub'
require 'shoulda_lite/association_matcher'
require 'shoulda_lite/association_matcher/though_matcher'
require 'shoulda_lite/association_matcher/dependent_matcher'
require 'shoulda_lite/validation_matcher'
require 'shoulda_lite/validation_matcher/length_matcher'
require 'shoulda_lite/valid_value_matcher'
module ShouldaLite
  def have_many(expected)
    AssociationMatcher.new(:has_many, expected)
  end
  def have_one(expected)
    AssociationMatcher.new(:has_one, expected)
  end
  def validate_presence_of(expected)
    AssociationMatcher.new(:validates_presence_of, expected)
  end
  def ensure_length_of(expected)
    ValidationMatcher.new(:ensure_length_of, expected)
  end
  def validate_uniqueness_of(column)
    ValidationMatcher.new(:uniqueness, column)
  end
  def allow_value(value)
    ValidValueMatcher.new(value)
  end
end
