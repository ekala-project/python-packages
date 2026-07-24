{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "progressbar33";
  version = "2.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Uf4NmztAI9svmD7szfyMmEa4TbhEO5vuACx/WPQ3bv8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "progressbar" ];

  meta = {
    description = "Text progressbar library for python";
    homepage = "https://pypi.org/project/progressbar33/";
    license = lib.licenses.lgpl3Plus;
  };
}
