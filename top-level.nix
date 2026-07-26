# These will be added to the pkgs scope
final: prev: {
  ansi2html = with final.python3Packages; toPythonApplication ansi2html;
  exifread = with final.python3Packages; toPythonApplication exifread;
  ghp-import = with final.python3Packages; toPythonApplication ghp-import;
  glad = with final.python3Packages; toPythonApplication glad;
  gpxinfo = with final.python3Packages; toPythonApplication gpxpy;
  eradicate = with final.python3Packages; toPythonApplication eradicate;
  fastep = with final.python3Packages; toPythonApplication fastentrypoints;
  huey = with final.python3Packages; toPythonApplication huey;
  libmpg123 = final.mpg123.override {
    libOnly = true;
    withConplay = false;
  };
  pox = with final.python3Packages; toPythonApplication pox;
  rnc2rng = with final.python3Packages; toPythonApplication rnc2rng;
  scour = with final.python3Packages; toPythonApplication scour;
  shortuuid = with final.python3Packages; toPythonApplication shortuuid;
  tte = with final.python3Packages; toPythonApplication terminaltexteffects;
  wakeonlan = with final.python3Packages; toPythonApplication wakeonlan;
  yarn-berry_3 = final.yarn-berry.override { berryVersion = 3; };
}
