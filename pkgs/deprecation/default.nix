{
  lib,
  buildPythonPackage,
  fetchPypi,
  packaging,
}:

buildPythonPackage rec {
  pname = "deprecation";
  version = "2.1.0";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1zqqjlgmhgkpzg9ss5ki8wamxl83xn51fs6gn2a8cxsx9vkbvcvj";
  };

  propagatedBuildInputs = [ packaging ];

  meta = {
    description = "Library to handle automated deprecations";
    homepage = "https://deprecation.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
