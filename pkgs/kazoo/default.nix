{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "kazoo";
  version = "2.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-kFeWrk9MEr1OSukubl0BhDnmtWyM+7JIJTYuebIw2rE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "kazoo" ];

  meta = {
    description = "Higher Level Zookeeper Client";
    homepage = "https://kazoo.readthedocs.org";
    license = lib.licenses.asl20;
  };
}
