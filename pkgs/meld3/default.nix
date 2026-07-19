{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "meld3";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PqJmmU8aqDUHZ5pntJO4UsIyp5BeKUQKa4aFWMrV53U=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "meld3" ];

  meta = {
    homepage = "https://github.com/supervisor/meld3";
    description = "HTML/XML templating engine";
    license = lib.licenses.free;
  };
}
