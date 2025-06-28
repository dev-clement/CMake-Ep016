# Set up a macro that increments a variable
macro(IncrementCounter VAR)
    math(EXPR ${VAR} "${${VAR}} + 1")
    # As macro doesn't have a scope, there is no need to do 
    # something like the line below to reset the variable again
    # set(${VAR} ${${VAR}} PARENT_SCOPE)
endmacro()

# Define a variable
set(MyVariable 0)

# Call the macro to increment the variable
IncrementCounter(MyVariable)
# Print the value of MyVariable after on incrementation
message("MyVariable: ${MyVariable}")

# Increment the variable again using the macro
IncrementCounter(MyVariable)
# Print the value of MyVariable after the second incrementation
message("MyVariable: ${MyVariable}")

# Instead, you can also create a loop
# That will call IncrementCounter twice
foreach(loop_var RANGE 1)
    message("Loop var ${loop_var}")
    IncrementCounter(MyVariable)
    message("After incrementation number ${loop_var}: ${MyVariable}")
endforeach()