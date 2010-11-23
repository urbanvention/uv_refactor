module Refactor

  autoload :Deprecation, 'uv_refactor/deprecation'

  mattr_accessor :deprecation_method
  @@deprecation_method = lambda {|old_method, new_method, klass|
    if klass.instance_methods.include?(old_method)
      Deprecation.remove_old_method(old_method,
                                    klass,
                                    caller(0)[1])
    end

    unless klass.instance_methods.include?(new_method)
      Deprecation.missing_database_entry(new_method,klass)
      define_method(new_method) do
        self.class_eval { attr_accessor new_method }
      end
    end

    define_method(old_method) do |*args, &block|
      Deprecation.
        renaming_warning(old_method,
                         new_method,
                         caller(0)[1])
      send(new_method, *args, &block)
    end
  }

  def self.setup
    yield self
  end

  def self.included(base)
    base.send(:include, Deprecation)
  end
end
