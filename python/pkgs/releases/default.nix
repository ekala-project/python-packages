{
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  lib,
  semantic-version,
  sphinx,
}:

buildPythonPackage rec {
  pname = "releases";
  version = "2.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bitprophet";
    repo = "releases";
    tag = version;
    hash = "sha256-IgEKAUk97R3ZvqvexD/ptT8i0uf48K+DKkk4q3pn3G8=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py --replace "semantic_version<2.7" "semantic_version"
  '';

  dependencies = [
    semantic-version
    sphinx
  ];

  pythonImportsCheck = [ "releases" ];

  meta = {
    description = "Sphinx extension for changelog manipulation";
    homepage = "https://github.com/bitprophet/releases";
    license = lib.licenses.bsd2;
  };
}
