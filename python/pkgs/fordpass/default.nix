{
  lib,
  requests,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "fordpass";
  version = "0.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "clarkd";
    repo = "fordpass-python";
    tag = finalAttrs.version;
    sha256 = "0i1dlswxc2bv1smc5d4r1adbxbl7sgr1swh2cjfajp73vs43xa0m";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # Project has no tests

  pythonImportsCheck = [ "fordpass" ];

  meta = {
    description = "Python module for the FordPass API";
    mainProgram = "demo.py";
    homepage = "https://github.com/clarkd/fordpass-python";
    license = lib.licenses.mit;
  };
})
