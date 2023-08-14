program Main
    implicit none
    interface
        integer(c_int) function add(x, y) bind(C)
            use, intrinsic :: iso_c_binding, only: c_int
            integer(c_int), value :: x, y
        end function add
    end interface

    integer :: result, a = 12, b = 22
    result = add(a, b)
    print "(a7,i3)", "result:", result
end program Main
