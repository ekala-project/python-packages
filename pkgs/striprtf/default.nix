{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage rec {
  pname = "striprtf";
  version = "0.0.32";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fzdaN12ZonAIQhcxaMkMm1RcskQkH/xdho7Z9rr5FV8=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "striprtf" ];

  meta = {
    description = "Simple library to convert rtf to text";
    homepage = "https://github.com/joshy/striprtf";
    license = lib.licenses.bsd3;
  };
}
