# These will be added to the pkgs scope
final: prev: {
  ansi2html = with final.python3Packages; toPythonApplication ansi2html;
  ghp-import = with final.python3Packages; toPythonApplication ghp-import;
  gpxinfo = with final.python3Packages; toPythonApplication gpxpy;
  eradicate = with final.python3Packages; toPythonApplication eradicate;
  huey = with final.python3Packages; toPythonApplication huey;
  rnc2rng = with final.python3Packages; toPythonApplication rnc2rng;
}
