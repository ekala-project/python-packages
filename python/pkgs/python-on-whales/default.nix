{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  pydantic,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-on-whales";
  version = "0.81.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "gabrieldemarmiesse";
    repo = "python-on-whales";
    tag = "v${finalAttrs.version}";
    hash = "sha256-aCIKWrOg+tzI9KJWcBK0ElssgOdxU/RTXgDOhSlBG3g=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pydantic
  ];

  pythonImportsCheck = [ "python_on_whales" ];

  meta = {
    description = "Docker client for Python, designed to be fun and intuitive";
    homepage = "https://github.com/gabrieldemarmiesse/python-on-whales";
    license = lib.licenses.mit;
  };
})
