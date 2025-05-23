## Copyright (C) 2025 User
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} jacobbi (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: User <User@COMPUTADORA>
## Created: 2025-04-14

function [x,it,r_h] = jacobbi(A,b,x0,maxit,tol)
  it = 0;
  while (r_h>tol && it<=itmax)
    for i=1:1:n
      x(i) = (b(i)-x0(1:i-1)*A(i,1:i-1) - x(i+1:n)*A(i,i+1:n))/A(i,i);
    endfor
    r_h=norm(A*x0-b,inf);
    it = it +1;
  endwhile
endfunction














