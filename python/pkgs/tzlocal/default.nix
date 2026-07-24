{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tzlocal";
  version = "5.4.4";

  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jbuGYIOGiKe2uk/tMdGN7fhCr7TUfKBQ1tiRwsFfO+Q=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "tzlocal" ];

  meta = {
    description = "Tzinfo object for the local timezone";
    homepage = "https://github.com/regebro/tzlocal";
    license = lib.licenses.mit;
  };
}
