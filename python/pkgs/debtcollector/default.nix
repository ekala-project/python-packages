{
  lib,
  buildPythonPackage,
  fetchPypi,
  pbr,
  six,
  setuptools,
  wrapt,
}:

buildPythonPackage rec {
  pname = "debtcollector";
  version = "3.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-J4pFYIzxbnnArhCFHYaRhca3j4ZhDfjyekUaGMH+xzI=";
  };

  build-system = [
    pbr
    setuptools
  ];

  dependencies = [
    six
    wrapt
  ];

  pythonImportsCheck = [ "debtcollector" ];

  meta = {
    description = "Collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner";
    homepage = "https://github.com/openstack/debtcollector";
    license = lib.licenses.asl20;
    teams = [ ];
  };
}
