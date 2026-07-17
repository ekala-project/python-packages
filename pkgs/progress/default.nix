{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "progress";
  version = "1.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-wbpxn4Ys6IUjKnWeq0eXH+dN/Hu3arilHvWUC601CGw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "progress" ];

  meta = {
    homepage = "https://github.com/verigak/progress/";
    description = "Easy to use progress bars";
    license = lib.licenses.mit;
  };
}
