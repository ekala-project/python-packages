{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
  click,
  jinja2,
  terminaltables,
}:

buildPythonPackage rec {
  pname = "envs";
  version = "1.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nYQ1xphdHN1oKZ4ExY4r24rmz2ayWWqAeeb5qT8qA5g=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    click
    jinja2
    terminaltables
  ];

  pythonImportsCheck = [ "envs" ];

  meta = {
    description = "Easy access to environment variables from Python";
    homepage = "https://github.com/capless/envs";
    license = lib.licenses.asl20;
  };
}
