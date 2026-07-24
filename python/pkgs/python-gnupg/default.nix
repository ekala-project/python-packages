{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "python-gnupg";
  version = "0.5.6";
  pyproject = true;

  src = fetchPypi {
    pname = "python_gnupg";
    inherit version;
    hash = "sha256-V0PpYhLTiSP8GQg4EtwSeQfkTb07zw201lfikdPCHqw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "gnupg" ];

  meta = {
    homepage = "https://github.com/vsajip/python-gnupg";
    description = "API for the GNU Privacy Guard (GnuPG)";
    license = lib.licenses.bsd3;
  };
}
