=====
To do
=====

In file :file:`tree_statistic/src/cpp/base_int_fl_containers.hpp` : 

   build-scons/src/cpp/base_int_fl_containers.hpp:163:10: error: non-const lvalue reference to type 'double' cannot bind to a temporary of type 'int'
      return 0;

.. code-block:: cpp

   template<int inb_integral>
   
   double& Base_Int_fl_container<inb_integral, 0>::Double(int i)
   
   {
   
     assert(i < _nb_float);
   
   #ifdef __GNUC__  
   
     #warning no return statement
   
   #endif
   
     return 0;
   
   }
