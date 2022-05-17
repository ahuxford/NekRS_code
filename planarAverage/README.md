Take planar average in NekRS using Nek5000 subroutines
- based on Dillon Shaver's usrcode repo
- Last edit: May 17 2022

Usage:
This uses Dillon's `planar_ave_m1` and `planar_ave_m2`
- m1 is for most variables (lx1 variables)
- m2 is for pressure only (lx2 variables)

Modify input `eps` supplied in order for the function's
cross section to match the expected value based on the mesh domain.
- eps is ~ half thickness of volume for creating approximate plane
- Cross section area = 2.0 * glsum(w2,1)/eps
