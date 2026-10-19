{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "hkavr";
  version = "0.0.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-wa0yS0KPdrQUuxxViweESD6Itn2rFlTwwrPQ0COWIPc=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # Module has no tests

  pythonImportsCheck = [ "hkavr" ];

  meta = {
    description = "Library for interacting with Harman Kardon AVR controllers";
    homepage = "https://github.com/Devqon/hkavr";
    license = lib.licenses.mit;
  };
}
