# These will be added to the pkgs scope
final: prev: {
  gpxinfo = with final.python3Packages; toPythonApplication gpxpy;
  huey = with final.python3Packages; toPythonApplication huey;
}
