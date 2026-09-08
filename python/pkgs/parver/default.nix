{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  attrs,
  arpeggio,
}:

buildPythonPackage rec {
  pname = "parver";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-pY8SOrGijG93Oo8RMlicocXUMKLFsmEeD8b7Nm3xJiI=";
  };

  build-system = [ hatchling ];

  dependencies = [
    attrs
    arpeggio
  ];

  pythonImportsCheck = [ "parver" ];

  meta = {
    description = "Allows parsing and manipulation of PEP 440 version numbers";
    homepage = "https://github.com/RazerM/parver";
    license = lib.licenses.mit;
  };
}
