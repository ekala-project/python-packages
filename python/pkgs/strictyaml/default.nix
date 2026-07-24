{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  ruamel-yaml,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "strictyaml";
  version = "1.7.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IvhUpfyrQrXduoAwoOS+UcqJrwJnlhyNbPqGOVWGxAc=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "ruamel.yaml==0.17.4" "ruamel.yaml"
  '';

  dependencies = [
    ruamel-yaml
    python-dateutil
  ];

  pythonImportsCheck = [ "strictyaml" ];

  meta = {
    description = "Strict, typed YAML parser";
    homepage = "https://hitchdev.com/strictyaml/";
    license = lib.licenses.mit;
  };
}
