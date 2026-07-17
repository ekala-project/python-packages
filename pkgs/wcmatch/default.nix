{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  bracex,
}:

buildPythonPackage rec {
  pname = "wcmatch";
  version = "10.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8R+UIIyMhIShb09IY4qF13HZUT9Ks/N1lZeIAcuUZa8=";
  };

  build-system = [ hatchling ];

  dependencies = [ bracex ];

  pythonImportsCheck = [ "wcmatch" ];

  meta = {
    homepage = "https://github.com/facelessuser/wcmatch";
    description = "Wilcard File Name matching library";
    license = lib.licenses.mit;
  };
}
