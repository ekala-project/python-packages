# These will be added to the pkgs scope
final: prev: {
  ansi2html = with final.python3Packages; toPythonApplication ansi2html;
  gpxinfo = with final.python3Packages; toPythonApplication gpxpy;
  huey = with final.python3Packages; toPythonApplication huey;
}
