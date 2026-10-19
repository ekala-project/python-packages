{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "hlk-sw16";
  version = "0.0.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jameshilliard";
    repo = "hlk-sw16";
    tag = version;
    sha256 = "010s85nr6xn89i8yvdagg72a97dh1v2pyfqa33v76p9p8xbgh8dz";
  };

  build-system = [ setuptools ];

  # no tests implemented

  pythonImportsCheck = [ "hlk_sw16" ];

  meta = {
    description = "Python client for HLK-SW16";
    homepage = "https://github.com/jameshilliard/hlk-sw16";
    license = lib.licenses.mit;
  };
}
