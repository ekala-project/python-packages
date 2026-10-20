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
  setuptools_80,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "astroquery";
  version = "0.4.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "astropy";
    repo = "astroquery";
    tag = "v${finalAttrs.version}";
    hash = "sha256-BcdRBPnJfuW17p31xUhjBmP7Lv98CnmOTCO4aU0xpMM=";
  };

  build-system = [
    setuptools_80
    setuptools-scm
  ];

  dependencies = [
    astropy
    requests
    keyring
    beautifulsoup4
    html5lib
    pyvo
  ];

  postPatch = ''
    substituteInPlace setup.cfg --replace "auto_use = True" "auto_use = False"
    # Remove astropy_helpers dependency - use setuptools directly
    cat > setup.py << 'EOF'
from setuptools import setup
setup()
EOF
    # Remove extra directories that confuse flat-layout discovery
    rm -rf astropy_helpers licenses
  '';

  meta = {
    description = "Functions and classes to access online data resources";
    homepage = "https://astroquery.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
})
