Track y+ in NekRS using Nek5000 subroutines
- based on Dillon Shaver's usrcode repo
- Last edit: May 17 2022

Warning:
In the current version, you must specify mu and rho
in limits.f. Can probably fix this issue but didn't want
to put in more time.

In Nek5000, mu = vdiff(1,1,1,1,1), but is 0 when accessed
and rho = vtrans(1,1,1,1,1), but is 0 when accessed

Also, do not call print_limits, it will break
the y+ function. Not sure why, could probably fix this too.
