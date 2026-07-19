{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "osrf-pycommon";
  version = "2.1.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "osrf";
    repo = "osrf_pycommon";
    tag = finalAttrs.version;
    hash = "sha256-gKYeCvcJDJkW2OYP7K3eyztuPSkzE8dHoTUh4sKvxcM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "osrf_pycommon" ];

  meta = {
    description = "Commonly needed Python modules used by Python software developed at OSRF";
    homepage = "http://osrf-pycommon.readthedocs.org/";
    changelog = "https://github.com/osrf/osrf_pycommon/blob/${finalAttrs.src.tag}/CHANGELOG.rst";
    license = lib.licenses.asl20;
  };
})
