{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "types_mock";
  version = "5.2.0.20250924";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lTGXVDtBg/ADY+jmJvbHq+oaP3pN1p0Zmt23CwG2uzU=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Type stub package for the mock package";
    homepage = "https://pypi.org/project/types-mock";
    license = lib.licenses.asl20;
  };
}
