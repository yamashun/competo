require "competo/version"

module Competo
  class Error < StandardError; end
  # Your code goes here...
  class Version
    attr_accessor :version_array, :version_string

    VERSION_ARRAY_LENGTH = 3

    def initialize(version_string)
      @version_string = version_string
      @version_array = version_string_to_array
    end

    def ==(other)
      other = build_version_object(other)

      VERSION_ARRAY_LENGTH.times do |i|
        return false unless version_array[i] == other.version_array[i]
      end
      true
    end

    def >(other)
      other = build_version_object(other)

      VERSION_ARRAY_LENGTH.times do |i|
        if version_array[i] > other.version_array[i]
          return true
        elsif version_array[i] < other.version_array[i]
          return false
        end
      end
      false
    end

    def >=(other)
      other = build_version_object(other)

      VERSION_ARRAY_LENGTH.times do |i|
        if version_array[i] > other.version_array[i]
          return true
        elsif version_array[i] < other.version_array[i]
          return false
        end
      end
      true
    end

    def <(other)
      other = build_version_object(other)

      VERSION_ARRAY_LENGTH.times do |i|
        if version_array[i] < other.version_array[i]
          return true
        elsif version_array[i] > other.version_array[i]
          return false
        end
      end
      false
    end

    def <=(other)
      other = build_version_object(other)

      VERSION_ARRAY_LENGTH.times do |i|
        if version_array[i] < other.version_array[i]
          return true
        elsif version_array[i] > other.version_array[i]
          return false
        end
      end
      true
    end

    alias_method :equal?, :==
    alias_method :greater_or_equal?, :>=
    alias_method :greater?, :>
    alias_method :less_or_equal?, :<=
    alias_method :less?, :<

    private

    def version_string_to_array
      array = @version_string.split('.').map(&:to_i)
      if array.length < VERSION_ARRAY_LENGTH
        until array.length >= VERSION_ARRAY_LENGTH
          array.push(0)
        end
      elsif array.length > VERSION_ARRAY_LENGTH
        array = array.slice(0, VERSION_ARRAY_LENGTH - 1)
      end

      array
    end

    def build_version_object(other)
      return other if other.is_a?(self.class)

      self.class.new(other)
    end
  end
end
