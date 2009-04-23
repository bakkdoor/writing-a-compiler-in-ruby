
def __new_class_object(size)
  ob = malloc(size)
  %s(assign (index ob 0) Class)
  ob
end

class Class
  def new
    ob = malloc(4)
    %s(assign (index ob 0) self)
    ob
  end


  # still need to implement define_method
  # using some lowlevel operations to modify the vtable
  # for now, we could only make sure, that whenever this is used
  # within class declarations, we compile this statically.
  # we could simply skip the dynamic usage of define_method for now,
  # since this would require a fair amount of additional work.

#   def define_method(name, &block)
#     params = block.parameters # need to implement this i guess.
#     expressions = block.to_sexp # this as well
#     %(defun name (params)
#         expressions)

#     # or, as another way (so we don't need a #to_sexp method for blocks:
#     # simply call the block, it then needs to be implemented as a normal anonymous function
#     %s(defun name (params)
#        (block))
#   end

  def attr_accessor(*attributes)
    attributes.each do |attr|
      # define getter & setter
      attr_reader(attr)
      attr_writer(attr)
    end
  end

  def attr_reader(*attributes)
    attributes.each do |attr|
      define_method(attr) do
        instance_variable_get("@#{attr}")
      end
    end
  end

  def attr_writer(*attributes)
    attributes.each do |attr|
    define_method("#{attr}=") do |value|
      instance_variable_set("@#{attr}", value)
    end
    end
  end
end

