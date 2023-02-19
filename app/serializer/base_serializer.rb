# frozen_string_literal: true

class BaseSerializer
  def initialize(data, options)
    @data = data
    @options = options
  end

  def self.serialize(data, options = {})
    return serialize_collection(data, options) if data.respond_to?(:each)

    serialize_single(data, options)
  end

  def self.serialize_single(data, options)
    new(data, options).serialize_single
  end

  def self.serialize_collection(data, options)
    data.map do |datum|
      new(datum, options).serialize_single
    end
  end
end
