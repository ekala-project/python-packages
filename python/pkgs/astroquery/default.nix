{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  astropy,
  requests,
  keyring,
  beautifulsoup4,
  html5lib,
  pyvo,
  astropy-helpers,
  setuptools,
}:

buildPythonPackage rec {
  pname = "astroquery";
  version = "0.4.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "astropy";
    repo = "astroquery";
    tag = "v${version}";
    hash = "sha256-BcdRBPnJfuW17p31xUhjBmP7Lv98CnmOTCO4aU0xpMM=";
  };

  build-system = [
    astropy-helpers
    setuptools
  ];

  dependencies = [
    astropy
    requests
    keyring
    beautifulsoup4
    html5lib
    pyvo
  ];

  # Disable automatic update of the astropy-helper module
  postPatch = ''
    substituteInPlace setup.cfg --replace "auto_use = True" "auto_use = False"
  '';

  meta = {
    description = "Functions and classes to access online data resources";
    homepage = "https://astroquery.readthedocs.io/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
