module Refactor
  module Deprecation

    def self.included(base)
      base.send(:extend, ClassMethods)
      base.send(:include, Deprecation::InstanceMethods)
    end

    module ClassMethods
      def refactor_method(old_method,new_method)
        Refactor.deprecation_method.call(old_method,new_method, self)
      end
    end

    module InstanceMethods
      def refactor_warnings
        Deprecation::Warnings
      end
    end

    #----------------------------------------------------------------#
    # Warnings
    #----------------------------------------------------------------#
    Warnings = []
    class << self
      def missing_database_entry new_method, klass
        refactor_warning "Missing migration for #{klass} **#{new_method}**."
      end

      def renaming_warning(old_method,new_method,origin)
        whereabout = prettify(origin)
        refactor_warning "Remove **#{old_method}** with **#{new_method}** in #{whereabout}."
      end

      def remove_old_method(old_method,klass,origin)
        whereabout = prettify(origin)
        refactor_warning "Remove **#{old_method}** in #{klass}."
      end

      def refactor_warning(warning)
        Warnings << warning
        warn warning
      end

      def prettify(origin)
        stack_trace_line = origin.to_s.split(':in `block').first
      end
    end
  end
end
