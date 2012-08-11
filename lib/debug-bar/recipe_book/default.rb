require 'pp'
require 'awesome_print'
require 'cgi'

module DebugBar
  module RecipeBook
    # A default RecipeBook with recipes useful for Rails applications.
    class Default < Base

      # Displays params in a user readable fashion.
      #
      # If the :cutoff option is given, it auto-hides when the params are
      # more characters in length than the cutoff, otherwise it defaults to
      # a sane length.
      def params_recipe(opts={})
        return Proc.new do |b|
          params_s = b[:params].awesome_print_html
          hidden = params_s.length > opts.fetch(:cutoff, 160)
          ['Params', params_s, :hidden => hidden]
        end
      end

      # Displays the session in a pretty printed way.
      def session_recipe
        return Proc.new {|b| ['Session', b[:session].awesome_print_html, :hidden => false]}
      end

      # Displays the cookies.
      def cookies_recipe
        return Proc.new {|b| ['Cookies', b[:cookies].awesome_print_html, :hidden => true]}
      end

    end
  end
end
