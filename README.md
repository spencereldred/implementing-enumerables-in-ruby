# Implmenting Enumerable

Something is wrong with Ruby! The Enumerable methods that we know and love have
stopped working (not really, but let's pretend).

Let's implement some of our favorite Enumerable methods (each, select, map, etc) without using any of
the built in methods that Ruby gives us. We will add `g_` to the methods names
to make sure that we don't interfere with Ruby's built in methods.

## Enumerable methods

In this exercise we are going to re-implement some of the methods that Ruby
provides for us and that we commonly use:

- each
- select
- reject
- map
- find
- select!

Although both hashes and arrays are enumerable, we are going to focus only on
arrays for this exercise. As you are going through the exercise, you may want
to reference to the documentation for both Array and Enumerable to check
the expected behavior of some of the methods we are going to be implementing:

- [Array](http://www.ruby-doc.org/core-2.1.2/Array.html)
- [Enumerable](http://www.ruby-doc.org/core-2.1.2/Enumerable.html)

Instead of using the same name that Ruby gives to these methods, we will add `g_`
to the beginning of each method so that we make sure not to clash with any of the
built in Ruby methods. For example, we will implement `g_each`, `g_select`, etc.

## Mixins

We are going to define our methods in a module called `GschoolEnumerable`. Check out
`lib/gschool_enumerable.rb` for the structure.

Modules, or mixins, allow us to define methods and then add those methods to other
classes as desired. Here is an example:

    module NameMethods
      def full_name
        "#{first_name} #{last_name}"
      end
    end

This module defines a method that assumes it has access to a first_name and
last_name method. If you included this module in the following class

    class Person
      include NameMethods

      attr_reader :first_name, :last_name

      def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
      end
    end

Then instances of the Person class would have respond to an instance method called
`full_name`

    hunter = Person.new("Hunter", "G")
    puts hunter.full_name   # => "Hunter G"

Nice!

If you look at `spec/lib/gschool_enumerable_spec.rb#4`, you can see that in our
tests we are including the GschoolEnumerable module into the Array class. Once
we do that, we have access to all the instance methods we define in the
GschoolEnumerable class on each Array instance in our tests.

