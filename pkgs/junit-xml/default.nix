{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "junit-xml";
  version = "1.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3hagUZkNTiWjmCst2eidZxBnVIcYhmQW+uwU2d5W258=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  doCheck = false;

  pythonImportsCheck = [ "junit_xml" ];

  meta = {
    homepage = "https://github.com/kyrus/python-junit-xml";
    description = "Creates JUnit XML test result documents that can be read by tools such as Jenkins";
    license = lib.licenses.mit;
  };
}
