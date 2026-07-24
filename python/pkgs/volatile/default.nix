{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "volatile";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-m+Nq1QjjNU4BbBFd4Dl9wiA7mACnPZ0XfKnTeo06MdM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "volatile" ];

  meta = {
    description = "Small extension for the tempfile module";
    homepage = "https://github.com/mbr/volatile";
    license = lib.licenses.mit;
  };
}
