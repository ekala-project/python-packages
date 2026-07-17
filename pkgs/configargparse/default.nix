{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "configargparse";
  version = "1.7.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ecLdroNqHlkUtx1Y5LmtvZ93edTmNRpje30tm2xG09k=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "configargparse" ];

  meta = {
    homepage = "https://github.com/bw2/ConfigArgParse";
    description = "Drop-in replacement for argparse";
    license = lib.licenses.mit;
  };
}
