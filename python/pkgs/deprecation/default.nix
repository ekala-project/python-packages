{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  packaging,
}:

buildPythonPackage rec {
  pname = "deprecation";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1zqqjlgmhgkpzg9ss5ki8wamxl83xn51fs6gn2a8cxsx9vkbvcvj";
  };

  build-system = [ setuptools ];

  dependencies = [ packaging ];

  meta = {
    description = "Library to handle automated deprecations";
    homepage = "https://deprecation.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
