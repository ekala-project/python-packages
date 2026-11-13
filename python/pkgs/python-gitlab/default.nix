{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
  requests-toolbelt,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-gitlab";
  version = "8.6.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_gitlab";
    inherit (finalAttrs) version;
    hash = "sha256-0WAhZPtYqygM7vRg+vAVzsbn2Duy2cuuRLpEittVaO8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    requests-toolbelt
  ];

  pythonImportsCheck = [ "gitlab" ];

  meta = {
    description = "Interact with GitLab API";
    homepage = "https://github.com/python-gitlab/python-gitlab";
    license = lib.licenses.lgpl3Only;
  };
})
