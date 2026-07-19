{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ajpy";
  version = "0.0.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MBDh9APWJgnsC71p3B2WtZLYpmJ6H11FNSj6f4CofJw=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "ajpy" ];

  meta = {
    description = "AJP package crafting library";
    homepage = "https://github.com/hypn0s/AJPy";
    license = lib.licenses.lgpl2Only;
  };
}
