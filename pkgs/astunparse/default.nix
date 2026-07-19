{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
  wheel,
}:

buildPythonPackage rec {
  pname = "astunparse";
  version = "1.6.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Wtk6hFbw0ITDRW0Fn9mpLM5meWMjLL92Pqw7xbeUCHI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    wheel
  ];

  # tests not included with pypi release
  doCheck = false;

  pythonImportsCheck = [ "astunparse" ];

  meta = {
    description = "Factored out version of unparse found in the Python source distribution";
    homepage = "https://github.com/simonpercivall/astunparse";
    license = lib.licenses.bsd3;
  };
}
