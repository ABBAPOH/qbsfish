#include "class.h"

#include <iostream>

Class::Class() = default;
Class::~Class() = default;

void Class::foo()
{
    std::cout << "Hello from foo()" << std::endl;
}

