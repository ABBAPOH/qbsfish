#include <iostream>

#include <fishlib/class.h>

int main(int argc, char *argv[])
{
    (void)argc;
    (void)argv;
    Class c;
    c.foo();
    std::cout << "Hello, world!" << std::endl;
    return 0;
}
