all:
	gfortran -std=f2008 -Wall fortui.f90 test01.f90 -o test.x
	rm *.mod
	./test.x
