{
  lib,
  buildPythonPackage,
  fetchPypi,
  replaceVars,
  hatchling,
}:

buildPythonPackage rec {
  pname = "attrs";
  version = "26.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-0DzricsyKo/XBtT7kZQHN7ZkKqNpmP4TCpvJbJhe/zI=";
  };

  patches = [
    (replaceVars ./remove-hatch-plugins.patch {
      inherit version;
    })
  ];

  build-system = [ hatchling ];

  pythonImportsCheck = [ "attr" ];

  meta = {
    description = "Python attributes without boilerplate";
    homepage = "https://github.com/python-attrs/attrs";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
