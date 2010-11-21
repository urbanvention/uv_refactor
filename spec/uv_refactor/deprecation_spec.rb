require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

module Refactor
  describe Deprecation do
    class User
      include Refactor
      attr_accessor :foo

      refactor_method :old_method, :new_method
      refactor_method :old_foo, :foo

      def existing_method
        "this exists"
      end

      refactor_method :existing_method, :future_method
    end

    def migration_warning(method)
      /Missing migration for Refactor::User \*\*#{method}\*\*/
    end


    before :each do
      @user = User.new
    end

    it "should respond to old_method" do
      @user.should respond_to(:old_method)
    end

    it "should add missing migration warning for new_method" do
      @user.refactor_warnings.join(" ").should match(migration_warning("new_method"))
    end

    it "should respond_to new_method" do
      @user.should respond_to(:new_method)
    end

    it "should respond_to old_foo" do
      @user.should respond_to(:old_foo)
    end

    it "should not warn about a missing migration for foo" do
      @user.refactor_warnings.join(" ").should_not match(migration_warning("foo"))
    end

    it "should hint if old method exists and you're refactoring" do
      @user.refactor_warnings.join(" ").should match(/Remove \*\*existing_method\*\*/)
    end

    it "should warn about old methods" do
      @user.old_foo
      @user.refactor_warnings.join(" ").should match(/deprecation_spec.rb/)
    end
  end
end
