{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "inwx-domrobot";
  version = "3.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "inwx";
    repo = "python-client";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Nbs3xroJD61NbpaiTdjA3VFxzXIlnqmB1d7SJDj8VN8=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # No tests

  pythonImportsCheck = [ "INWX" ];

  meta = {
    description = "INWX Domrobot Python Client";
    homepage = "https://github.com/inwx/python-client";
    license = lib.licenses.mit;
  };
})
